import 'package:flutter/material.dart';
import 'package:piggymon/models/monthly_expense.dart';
import 'package:piggymon/page/add_monthly_expense_page.dart';
import 'package:piggymon/provider/monthly_expenses.dart';
import 'package:piggymon/widget/monthly_expense_tile_widget.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';
import 'package:provider/provider.dart';

// Andrea

class MonthlyExpensesPage extends StatelessWidget{
  final padding = EdgeInsets.symmetric(horizontal: 20);


  @override
  Widget build(BuildContext context) {
    final MonthlyExpenses monthly_expenses = Provider.of(context);

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Despesas Mensais'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddMonthlyExpensePage()));
        },
        // label: const Text('Adicionar transação'),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: monthly_expenses.count,
        itemBuilder: (ctx, i) =>
            MonthlyExpenseTile(monthly_expenses.byIndex(i)),
      ),
    );
    }
  
}