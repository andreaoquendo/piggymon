import 'package:flutter/material.dart';
import 'package:piggymon/models/monthly_expenses.dart';

class MonthlyExpenseTile extends StatelessWidget {

  final MonthlyExpense mExpense;

  const MonthlyExpenseTile(this.mExpense);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.attach_money_rounded)),
      title: Text(mExpense.name),
      subtitle: Text('Dia Descontado: ' + mExpense.day.toString() + ' Valor: R\$' + mExpense.quantity.toString()),
      trailing: IconButton(
        icon: Icon(Icons.edit),
      onPressed: (){},)
      // onLongPress
    );
  }
}