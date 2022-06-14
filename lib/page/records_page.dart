import 'package:flutter/material.dart';
import 'package:piggymon/data/dummy_transactions.dart';
import 'package:piggymon/provider/transactions.dart';
import 'package:piggymon/widget/transaction_tile_widget.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';
import 'package:provider/provider.dart';

// Andrea

class RecordsPage extends StatelessWidget{
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context){

    final Transactions records = Provider.of(context);

    return Scaffold(
      // drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Histórico'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: records.count,
        itemBuilder: (ctx, i) => TransactionTile(records.byIndex(i)),
      ),
    );
  }

}