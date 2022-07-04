final String tableMonthlyExpenses = 'monthly_expenses';

class MonthlyExpenseFields {
  static final List<String> values = [
    id, accountId, isExpense, day, name, value, category
  ];

  static final String id = '_id';
  static final String accountId = '_accountId';
  static final String isExpense = 'isExpense';
  static final String day = 'day';
  static final String name = 'name';
  static final String value = 'value';
  static final String category = 'category';

}

class MonthlyExpense {
  final int? id;
  final int accountId;
  final bool isExpense;
  final int day;
  final String name;
  final num value;
  final String category;

  const MonthlyExpense({
    this.id,
    required this.accountId,
    required this.isExpense,
    required this.day,
    required this.name,
    required this.value,
    this.category = ' '
  });

  MonthlyExpense copy({
    int? id,
    int? accountId,
    bool? isExpense,
    int? day,
    String? name,
    num? value,
    String? category,
  }) => MonthlyExpense(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      isExpense: isExpense ?? this.isExpense,
      day: day ?? this.day,
      name: name ?? this.name,
      value: value ?? this.value,
      category: category ?? this.category
  );

  Map<String, Object?> toJson() => {
    MonthlyExpenseFields.id: id ,
    MonthlyExpenseFields.accountId: accountId,
    MonthlyExpenseFields.isExpense: isExpense ? 1 : 0,
    MonthlyExpenseFields.day: day,
    MonthlyExpenseFields.name: name,
    MonthlyExpenseFields.value: value,
    MonthlyExpenseFields.category: category
  };

  static MonthlyExpense fromJson(Map<String, Object?> json) => MonthlyExpense(
      id:json[MonthlyExpenseFields.id] as int,
      accountId: json[MonthlyExpenseFields.accountId] as int,
      isExpense: json[MonthlyExpenseFields.isExpense] == 1,
      day: json[MonthlyExpenseFields.day] as int,
      name: json[MonthlyExpenseFields.name] as String,
      value: json[MonthlyExpenseFields.value] as num,
      category: json[MonthlyExpenseFields.category] as String
  );

}