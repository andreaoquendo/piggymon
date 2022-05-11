import 'package:flutter/material.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';

class RecordsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Histórico'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    body: const Center(
        child: Text('Historico', style: const TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 3,)
    ),
  );
}