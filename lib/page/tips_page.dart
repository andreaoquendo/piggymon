import 'package:flutter/material.dart';
import 'package:piggymon/data/dummy_tips.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';
import 'package:piggymon/widget/tip_tile_widget.dart';

class TipsPage extends StatelessWidget{

  final tips = {...DUMMY_TIPS};
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Dicas'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    body: ListView.builder(
      itemCount:tips.length,
      itemBuilder: (ctx, i) => TipTile(tips.values.elementAt(i)),
    ),
  );
}