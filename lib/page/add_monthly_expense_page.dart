import 'dart:math';

import 'package:flutter/material.dart';
import 'package:piggymon/models/monthly_expense.dart';
import 'package:piggymon/provider/monthly_expenses.dart';

import 'package:provider/provider.dart';

class AddMonthlyExpensePage extends StatelessWidget{

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(MonthlyExpense mExpense){
    if(mExpense != null){
      _formData['id'] = mExpense.id.toString();
      _formData['day'] = mExpense.day.toString();
      _formData['name'] = mExpense.name;
      _formData['quantity'] = mExpense.quantity.toString();
    }
  }


  @override
  Widget build(BuildContext context){
    final mExpense =  ModalRoute.of(context)?.settings.arguments as MonthlyExpense;

    _loadFormData(mExpense);


    return Scaffold(
      appBar: AppBar(
        title: Text('Despesa Mensal'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
              onPressed: (){
                final isValid = _form.currentState?.validate();
                if(isValid == true){
                  _form.currentState?.save();
                  if(_formData['id'] == null){
                    _formData['id'] = Random().nextInt(100).toString();
                  }
                  Provider.of<MonthlyExpenses>(context, listen: false).put(
                      MonthlyExpense(
                        id: int.parse(_formData['id'].toString()),
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
                initialValue: _formData['name'],
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
                  initialValue: _formData['quantity'],
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
                initialValue: _formData['day'],
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