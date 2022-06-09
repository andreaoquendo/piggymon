import 'dart:math';

import 'package:flutter/material.dart';
import 'package:piggymon/models/monthly_expense.dart';
import 'package:piggymon/provider/monthly_expenses.dart';

import 'package:provider/provider.dart';

// Henrique

class AddMonthlyExpensePage extends StatelessWidget{

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context){
    final MonthlyExpense mExpense =  ModalRoute.of(context)?.settings.arguments as MonthlyExpense;

    return Scaffold(
      appBar: AppBar(
        title: Text('Despesa Mensal'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
              onPressed: (){
                final isValid = _form.currentState?.validate();
                print('chegou ate aqui');
                if(isValid == true){
                  _form.currentState?.save();
                  Provider.of<MonthlyExpenses>(context, listen: false).put(
                      MonthlyExpense(
                        id: Random().nextInt(100),
                        day: int.parse(_formData['day'].toString()),
                        name: _formData['name'].toString(),
                        quantity: num.parse(_formData['quantity'].toString()),
                      ));
                  Navigator.of(context).pop();
                }

              },
              icon: Icon(Icons.save)
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nome'
                ),
                validator: (value) {
                  if(value == null || value.isEmpty)
                    return 'Nome inválido';
                },
                onSaved: (value){
                  if(value != null)
                    _formData['name'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Valor'
                ),
                validator: (value) {
                  if(value == null || value.isEmpty)
                    return 'Por favor, insira um valor';
                },
                onSaved: (value){
                  if(value != null)
                    _formData['quantity'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Dia do mês'
                ),
                validator: (value) {
                  if(value == null || value.isEmpty)
                    return 'Por favor, insira um valor';
                },
                onSaved: (value){
                  if(value != null)
                    _formData['day'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Categoria'
                ),
                onSaved: (value){
                  if(value != null)
                    _formData['category'] = value;
                  else
                    _formData['category'] = 'none';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}