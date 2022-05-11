import 'package:flutter/material.dart';

class AddCategoryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Adicionar Categoria'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    body: const Center(
        child: Text('Adicionar Categoria', style: const TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 3,)
    ),
  );
}