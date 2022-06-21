import 'package:flutter/material.dart';
import 'package:piggymon/provider/monthly_expenses.dart';
import 'package:piggymon/routes/piggymon_routes.dart';
import 'package:piggymon/widget/monthly_expense_tile_widget.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';
import 'package:provider/provider.dart';

// Andrea

class MonthlyExpensesPage extends StatelessWidget{
  final padding = EdgeInsets.symmetric(horizontal: 20);


  @override
  Widget build(BuildContext context) {
    final MonthlyExpenses monthlyExpenses = Provider.of(context);
    final accountId =  ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      // drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Despesas Mensais'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           //Navigator.of(context).push(MaterialPageRoute(
             // builder: (context) => AddMonthlyExpensePage()));
          Navigator.of(context).pushNamed(
            PiggymonRoutes.MONTHLY_EXPENSE_FORM,
            arguments: accountId
          );
        },
        // label: const Text('Adicionar transação'),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: monthlyExpenses.getExpensesCount(accountId),
        itemBuilder: (ctx, i) =>
            MonthlyExpenseTile(monthlyExpenses.byIndex(i, accountId)),
      ),
    );
    }
  
}