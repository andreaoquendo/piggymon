import 'package:path/path.dart';
import 'package:piggymon/models/category.dart';
import 'package:piggymon/models/creditInfo.dart';
import 'package:piggymon/models/monthly_expense.dart';
import 'package:piggymon/models/record.dart';
import 'package:sqflite/sqflite.dart';
import 'package:piggymon/models/account.dart';

class PiggymonDatabase {
  static final PiggymonDatabase instance = PiggymonDatabase._init();

  static Database? _database;

  PiggymonDatabase._init();

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initDB('piggymon.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    
    return await openDatabase(
        path, version: 17,
        onCreate: _createDB,
        onUpgrade: _onUpgrade

    );
  }

  Future _createDB(Database db, int version) async {
    await _createTables(db);
  }

  Future _createTables(Database db) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final realType = 'REAL NOT NULL';
    final intType = 'INTEGER NOT NULL';
    final boolType = 'BOOL NOT NULL';

    await db.execute('''
    CREATE TABLE $tableAccounts (
     ${AccountFields.id} $idType,
     ${AccountFields.firstName} $textType,
     ${AccountFields.lastName} $textType,
     ${AccountFields.email} $textType,
     ${AccountFields.password} $textType,
     ${AccountFields.birthday} $textType,
     ${AccountFields.gender} $textType,
     ${AccountFields.photoLink} $textType
    )
    ''');

    await db.execute('''
    CREATE TABLE $tableCredit (
    ${CreditFields.accountId} INTEGER PRIMARY KEY,
    ${CreditFields.totalAvailable} $realType,
    ${CreditFields.outcomes} $realType,
    ${CreditFields.incomes} $realType,
    ${CreditFields.savingsGoal} $realType,
    FOREIGN KEY(${CreditFields.accountId}) REFERENCES $tableAccounts(${AccountFields.id})
    )
    ''');

    await db.execute('''
    CREATE TABLE $tableRecord (
    ${RecordFields.idTransac} $idType,
    ${RecordFields.accountId} $intType,
    ${RecordFields.category} $textType,
    ${RecordFields.value} $realType,
    ${RecordFields.isExpense} $boolType,
    FOREIGN KEY(${RecordFields.accountId}) REFERENCES $tableAccounts(${AccountFields.id})
    )
    ''');

    await db.execute('''
    CREATE TABLE $tableCategories (
    ${CategoryFields.id} $idType,
    ${CategoryFields.accountId} $intType,
    ${CategoryFields.name} $textType,
    FOREIGN KEY(${CategoryFields.accountId}) REFERENCES $tableAccounts(${AccountFields.id})
    )
    ''');

    await db.execute('''
    CREATE TABLE $tableMonthlyExpenses (
    ${MonthlyExpenseFields.id} $idType,
    ${MonthlyExpenseFields.accountId} $intType,
    ${MonthlyExpenseFields.isExpense} $boolType,
    ${MonthlyExpenseFields.day} $intType,
    ${MonthlyExpenseFields.name} $textType,
    ${MonthlyExpenseFields.value} $realType,
    ${MonthlyExpenseFields.category} $textType,
    FOREIGN KEY(${MonthlyExpenseFields.accountId}) REFERENCES $tableAccounts(${AccountFields.id})
    )
    ''');

  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async{
    print("DBHelper: _onUpgrade called");
    try {
      await db.transaction((Transaction txn) async {
        await txn.execute("DROP TABLE $tableCredit");
        await txn.execute("DROP TABLE $tableAccounts");
        await txn.execute("DROP TABLE $tableRecord");
        await txn.execute("DROP TABLE $tableCategories");
        await txn.execute("DROP TABLE $tableMonthlyExpenses");
      });
    } catch (e) {
      print("Error : " + e.toString());
    }
    _createTables(db);
  }
  // creates
  Future<Account> createAccount(Account ac) async{
    final db = await instance.database;

    final id = await db.insert(tableAccounts, ac.toJson());

    return ac.copy(id: id);

  }

  Future<CreditInfo> createCreditInfo(CreditInfo ci) async{
    final db = await instance.database;

    final accountId = await db.insert(tableCredit, ci.toJson());

    return ci.copy(accountId: accountId);

  }

  Future<Record> createRecord(Record rec) async{
    final db = await instance.database;

    final idTransac = await db.insert(tableRecord, rec.toJson());

    return rec.copy(idTransac: idTransac);
  }

  Future<Category> createCategory(Category cat) async {
    final db = await instance.database;

    final id = await db.insert(tableCategories, cat.toJson());

    return cat.copy(id: id);
  }

  Future deleteRecord(Record record) async {
    final db = await instance.database;

    await updateCreditInfoOnDelete(record.accountId, record.isExpense, record.value);
    await db.rawDelete('''
      DELETE FROM $tableRecord WHERE ${RecordFields.idTransac} = ? AND ${RecordFields.accountId} = ?
    ''',
    [record.idTransac, record.accountId]
    );
  }

  Future<List<Record>> readRecords(int accountId) async {
    final db = await instance.database;

    final result = await db.query(
        tableRecord,
        columns: RecordFields.values,
        where: '${RecordFields.accountId} = ?',
        whereArgs: [accountId]
    );
    final records = result.map((json) => Record.fromJson(json)).toList();

    return records;
  }

  Future<List<Record>> readRecordsByCategory(Category category) async {
    final db = await instance.database;

    final result = await db.query(
        tableRecord,
        columns: RecordFields.values,
        where: '${RecordFields.accountId} = ? AND ${RecordFields.category} = ?',
        whereArgs: [category.accountId, category.name]
    );
    final records = result.map((json) => Record.fromJson(json)).toList();

    return records;
  }

  Future<MonthlyExpense> createMonthlyExpense(MonthlyExpense m) async {
    final db = await instance.database;

    final id = await db.insert(tableMonthlyExpenses, m.toJson());

    return m.copy(id: id);
  }

  Future<List<MonthlyExpense>> readMonthlyExpenses(int accountId) async {
    final db = await instance.database;

    final result = await db.query(
        tableMonthlyExpenses,
        columns: MonthlyExpenseFields.values,
        where: '${MonthlyExpenseFields.accountId} = ?',
        whereArgs: [accountId]
    );
    final mExpenses = result.map((json) => MonthlyExpense.fromJson(json)).toList();

    return mExpenses;
  }

  Future<List<Category>> readCategories(int accountId) async {
    final db = await instance.database;

    final result = await db.query(
        tableCategories,
        columns: CategoryFields.values,
        where: '${CategoryFields.accountId} = ?',
        whereArgs: [accountId]
    );
    final categories = result.map((json) => Category.fromJson(json)).toList();

    return categories;
  }

  Future<List<String>> listCategories(int accountId) async {
    final db = await instance.database;

    final result = await db.query(
        tableCategories,
        columns: CategoryFields.values,
        where: '${CategoryFields.accountId} = ?',
        whereArgs: [accountId]
    );

    final names = result.map((json) => Category.fromJson(json).name).toList();
    names.add(' ');
    return names;
  }

  Future<Account> readAccount(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableAccounts,
      columns: AccountFields.values,
      where: '${AccountFields.id} = ?',
      whereArgs: [id]
    );

    if(maps.isNotEmpty)
      return Account.fromJson(maps.first);
    else
      throw Exception('ID $id not found');
  }

  Future<CreditInfo> readCreditInfo(int accountId) async {
    final db = await instance.database;

    final maps = await db.query(
        tableCredit,
        columns: CreditFields.values,
        where: '${CreditFields.accountId} = ?',
        whereArgs: [accountId]
    );

    if(maps.isNotEmpty)
      return CreditInfo.fromJson(maps.first);
    else
      throw Exception('ID $accountId not found');
  }

  Future updateCreditInfo(int accountId, bool isOutcome, num value) async {
    final db = await instance.database;

    final maps = await db.query(
        tableCredit,
        columns: CreditFields.values,
        where: '${CreditFields.accountId} = ?',
        whereArgs: [accountId]
    );

    CreditInfo cf = CreditInfo.fromJson(maps.first);

    if(isOutcome == true){
      cf.totalAvailable -=value;
      cf.outcomes += value;
    }else {
      cf.totalAvailable += value;
      cf.incomes += value;
    }

    await db.rawUpdate(
      'UPDATE $tableCredit SET ${CreditFields.incomes} = ?, ${CreditFields.outcomes} = ?, ${CreditFields.totalAvailable} = ? WHERE ${CreditFields.accountId} = ?',
      [cf.incomes, cf.outcomes, cf.totalAvailable, cf.accountId]
    );
  }

  Future updateCreditInfoOnDelete(int accountId, bool isOutcome, num value) async {
    final db = await instance.database;

    final maps = await db.query(
        tableCredit,
        columns: CreditFields.values,
        where: '${CreditFields.accountId} = ?',
        whereArgs: [accountId]
    );

    CreditInfo cf = CreditInfo.fromJson(maps.first);

    if(isOutcome == true){
      cf.totalAvailable +=value;
      cf.outcomes -= value;
    }else {
      cf.totalAvailable -= value;
      cf.incomes -= value;
    }

    await db.rawUpdate(
        'UPDATE $tableCredit SET ${CreditFields.incomes} = ?, ${CreditFields.outcomes} = ?, ${CreditFields.totalAvailable} = ? WHERE ${CreditFields.accountId} = ?',
        [cf.incomes, cf.outcomes, cf.totalAvailable, cf.accountId]
    );
  }

  Future<int> login(String email, String pwd) async {

    final db = await instance.database;

    final maps = await db.query(
        tableAccounts,
        columns: AccountFields.values,
        where: '${AccountFields.email} = ? AND ${AccountFields.password} = ?',
        whereArgs: [email, pwd]
    );

    return Account.fromJson(maps.first).id!;
  }

  Future<Map<int, Account>> readAllAccounts() async {
    final db = await instance.database;

    final result = await db.query(tableAccounts);

    final accounts = result.map((json) => Account.fromJson(json)).toList();

    Map<int,Account> map = {
      for (Account a in accounts) a.id! : a
    };

    return map;
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}