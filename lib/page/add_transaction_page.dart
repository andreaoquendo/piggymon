import 'package:flutter/material.dart';

class AddTransactionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Adicionar Transação'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    body: const Center(
        child: Text('Adicionar transacao', style: const TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 3,)
    ),
  );
}