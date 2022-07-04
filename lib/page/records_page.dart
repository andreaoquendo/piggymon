import 'package:flutter/material.dart';
import 'package:piggymon/data/dummy_transactions.dart';
import 'package:piggymon/db/database.dart';
import 'package:piggymon/models/record.dart';
import 'package:piggymon/provider/transactions.dart';
import 'package:piggymon/widget/transaction_tile_widget.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';
import 'package:provider/provider.dart';

class RecordsPage extends StatefulWidget {
  final dynamic accountId;

  RecordsPage({@required this.accountId});

  @override
  _RecordsPage createState() => _RecordsPage();
}

class _RecordsPage extends State<RecordsPage>{
  final padding = EdgeInsets.symmetric(horizontal: 20);

  late Future<List<Record>> records;

  @override
  void initState(){
    super.initState();

    records = getRecords(widget.accountId);
  }

  Future<List<Record>> getRecords(int id) async {
    return await PiggymonDatabase.instance.readRecords(id);
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      drawer: NavigationDrawerWidget(widget.accountId),
      appBar: AppBar(
        title: Text('Histórico'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Record>>(
        future: records,
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<Record> recs = snapshot.data!;
            return ListView.builder(
              itemCount: recs.length,
              itemBuilder: (ctx, i) {
                return Dismissible(
                    background: Container(
                      color: Colors.red
                    ),
                    onDismissed: (DismissDirection direction) async {
                      await PiggymonDatabase.instance.deleteRecord(recs[i]);
                      setState(() {
                        recs.removeAt(i);
                      });
                    },
                    key: ValueKey<Record>(recs[i]),
                    child: TransactionTile(recs[i])
                );
              },
            );
          } else {
            return Text('Carregando...');
          }
        },
      ),
    );
  }

}