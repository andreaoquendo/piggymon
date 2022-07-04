import 'package:flutter/material.dart';
import 'package:piggymon/db/database.dart';
import 'package:piggymon/models/category.dart';
import 'package:piggymon/models/record.dart';
import 'package:piggymon/provider/transactions.dart';
import 'package:piggymon/widget/transaction_tile_widget.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatefulWidget{
  final dynamic category;

  FilterPage({@required this.category});
  @override
  _FilterPage createState() => _FilterPage();
}

class _FilterPage extends State<FilterPage>{
  final padding = EdgeInsets.symmetric(horizontal: 20);

  late Future<List<Record>> records;

  @override
  void initState() {
    super.initState();
    records = getRecordsByCategory(widget.category);
  }

  Future<List<Record>> getRecordsByCategory(Category category) async {
    return await PiggymonDatabase.instance.readRecordsByCategory(category);
  }

  @override
  Widget build(BuildContext context){



    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Record>>(
        future: records,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<Record> recs = snapshot.data!;
            return ListView.builder(
              itemCount: recs.length,
              itemBuilder: (ctx, i) => TransactionTile(recs[i]),
            );
          } else {
            return Text('Carregando...');
          }
        },
      )
    );
  }

}