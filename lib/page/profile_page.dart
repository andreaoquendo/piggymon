import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Perfil'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    body: const Center(
        child: Text('Perfil', style: const TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 3,)
    ),
  );
}