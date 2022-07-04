import 'package:flutter/material.dart';
import 'package:piggymon/models/monthly_expense.dart';

class MonthlyExpenseTile extends StatelessWidget {

  final MonthlyExpense mExpense;

  const MonthlyExpenseTile(this.mExpense);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.attach_money_rounded)),
      title: Text(mExpense.name),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      subtitle: Text('Dia Previsto: ' + mExpense.day.toString() + '\nValor: R\$' + mExpense.value.toStringAsFixed(2).replaceAll('.', ',')),
      // onLongPress
    );
  }
}