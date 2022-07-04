import 'package:flutter/material.dart';
import 'package:piggymon/models/record.dart';

class TransactionTile extends StatelessWidget {

  final Record transaction;

  const TransactionTile(this.transaction);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: transaction.isExpense ? CircleAvatar(child: Icon(Icons.exposure_minus_1)) : CircleAvatar(child: Icon(Icons.plus_one),),
        title: Text('R\$' + transaction.value.toStringAsFixed(2)),
        subtitle: Text(transaction.category),
      // onLongPress
    );
  }
}