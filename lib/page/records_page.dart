import 'package:flutter/material.dart';
import 'package:piggymon/data/dummy_transactions.dart';
import 'package:piggymon/widget/transaction_tile_widget.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';

// Andrea

class RecordsPage extends StatelessWidget{
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final records = {...DUMMY_TRANSACTIONS};

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Histórico'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    body: ListView.builder(
      itemCount: records.length,
      itemBuilder: (ctx, i) => TransactionTile(records.values.elementAt(i)),
    ),
  );

}