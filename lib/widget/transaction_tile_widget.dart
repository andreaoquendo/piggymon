import 'package:flutter/material.dart';
import 'package:piggymon/models/transaction.dart';

class TransactionTile extends StatelessWidget {

  final Transaction transaction;

  const TransactionTile(this.transaction);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(child: Icon(Icons.exposure_minus_1)),
        title: Text('R\$' + transaction.value.toString()),
        subtitle: Text(transaction.category),
        trailing: IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: (){},)
      // onLongPress
    );
  }
}