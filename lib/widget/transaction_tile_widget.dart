import 'package:flutter/material.dart';
import 'package:piggymon/models/transaction.dart';
import 'package:piggymon/provider/transactions.dart';
import 'package:provider/provider.dart';

class TransactionTile extends StatelessWidget {

  final Transaction transaction;

  const TransactionTile(this.transaction);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: transaction.isExpense ? CircleAvatar(child: Icon(Icons.exposure_minus_1)) : CircleAvatar(child: Icon(Icons.plus_one),),
        title: Text('R\$' + transaction.value.toString()),
        subtitle: Text(transaction.category),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: (){
            Provider.of<Transactions>(context, listen: false).remove(transaction);
          },)
      // onLongPress
    );
  }
}