import 'package:flutter/material.dart';
import 'package:piggymon/models/category.dart';
import 'package:piggymon/provider/transactions.dart';
import 'package:piggymon/widget/transaction_tile_widget.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatelessWidget{
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context){

    final Transactions records = Provider.of(context);
    final category =  ModalRoute.of(context)?.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: records.transactionsByAccountAndCategory(category.accountId, category.name).length,
        itemBuilder: (ctx, i) => TransactionTile(records.byIndexCategory(i, category.accountId, category.name)),
      ),
    );
  }

}