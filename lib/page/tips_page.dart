import 'package:flutter/material.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';

class TipsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Dicas'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    body: const Center(
        child: Text('Dicas', style: const TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 3,)
    ),
  );
}