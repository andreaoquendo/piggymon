import 'package:flutter/material.dart';
import 'package:piggymon/db/database.dart';
import 'package:piggymon/models/monthly_expense.dart';
import 'package:piggymon/provider/monthly_expenses.dart';
import 'package:piggymon/routes/piggymon_routes.dart';
import 'package:piggymon/widget/monthly_expense_tile_widget.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';
import 'package:provider/provider.dart';

class MonthlyExpensesPage extends StatefulWidget{
  final dynamic accountId;

  MonthlyExpensesPage({@required this.accountId});
  @override
  _MonthlyExpensesPage createState() => _MonthlyExpensesPage();
}

class _MonthlyExpensesPage extends State<MonthlyExpensesPage>{
  final padding = EdgeInsets.symmetric(horizontal: 20);

  late Future<List<MonthlyExpense>> expensesList;

  @override
  void initState() {
    super.initState();

    expensesList = getExpenses(widget.accountId);
  }

  Future<List<MonthlyExpense>> getExpenses(int accountId) async {
    return await PiggymonDatabase.instance.readMonthlyExpenses(accountId);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: NavigationDrawerWidget(widget.accountId),
      appBar: AppBar(
        title: Text('Despesas Mensais'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            PiggymonRoutes.MONTHLY_EXPENSE_FORM,
            arguments: widget.accountId
          );
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<MonthlyExpense>>(
        future: expensesList,
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<MonthlyExpense> mExpenses = snapshot.data!;
            return ListView.builder(
              itemCount: mExpenses.length,
              itemBuilder: (ctx, i) =>
                  MonthlyExpenseTile(mExpenses[i]),
            );
          } else {
            return Text('Carregando...');
          }
        },
      ),
    );
    }
  
}