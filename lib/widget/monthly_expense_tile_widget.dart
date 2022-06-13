import 'package:flutter/material.dart';
import 'package:piggymon/models/monthly_expense.dart';
import 'package:piggymon/page/add_monthly_expense_page.dart';
import 'package:piggymon/provider/monthly_expenses.dart';
import 'package:piggymon/routes/piggymon_routes.dart';
import 'package:provider/provider.dart';

class MonthlyExpenseTile extends StatelessWidget {

  final MonthlyExpense mExpense;

  const MonthlyExpenseTile(this.mExpense);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.attach_money_rounded)),
      title: Text(mExpense.name),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      subtitle: Text('Dia Descontado: ' + mExpense.day.toString() + '\nValor: R\$' + mExpense.quantity.toString()),
      trailing: Container(
        width:96,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: (){
                Navigator.of(context).pushNamed(
                  PiggymonRoutes.MONTHLY_EXPENSE_FORM,
                  arguments: mExpense
                );
              },),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                Provider.of<MonthlyExpenses>(context, listen: false).remove(mExpense);

              },)
          ],

        ),
      )
      // onLongPress
    );
  }
}