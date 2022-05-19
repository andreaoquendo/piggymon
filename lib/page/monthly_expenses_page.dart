import 'package:flutter/material.dart';
import 'package:piggymon/data/dummy_monthly_expenses.dart';
import 'package:piggymon/widget/monthly_expense_tile_widget.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';

// Andrea

class MonthlyExpensesPage extends StatelessWidget{
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final monthly_expenses = {...DUMMY_MONTHLY_EXPENSES};

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Despesas Mensais'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    body: ListView.builder(
      itemCount: monthly_expenses.length,
      itemBuilder: (ctx, i) => MonthlyExpenseTile(monthly_expenses.values.elementAt(i)),
    ),
  );
  
}