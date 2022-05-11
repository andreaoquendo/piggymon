import 'package:flutter/material.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Perfil'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    /*body: const Center(
        child: Text('Perfil', style: const TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 3,)
    ),*/
    body: Text("Nome: \n\nEmail: \n\nData de Nascimento: \n\nGênero: ",
          style: TextStyle(fontSize: 25)
    ),
  );
}