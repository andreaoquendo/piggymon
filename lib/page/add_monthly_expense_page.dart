import 'dart:math';

import 'package:flutter/material.dart';
import 'package:piggymon/models/monthly_expense.dart';
import 'package:piggymon/provider/categories.dart';
import 'package:piggymon/provider/monthly_expenses.dart';

import 'package:provider/provider.dart';

class AddMonthlyExpensePage extends StatefulWidget {
  @override
  _AddMonthlyExpensePage createState() => _AddMonthlyExpensePage();
}

class _AddMonthlyExpensePage extends State<AddMonthlyExpensePage>{

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  String dropdownValue = 'Receita';
  String dropdownValueB = ' ';

  @override
  Widget build(BuildContext context){
    final accountId =  ModalRoute.of(context)?.settings.arguments as int;

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

                  var gasto = true;
                  if(dropdownValue == 'Receita') {
                    gasto = false;
                  }

                  Provider.of<MonthlyExpenses>(context, listen: false).put(
                      MonthlyExpense(
                        id: int.parse(_formData['id'].toString()),
                        accountId: accountId,
                        isExpense: gasto,
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
              SizedBox(height: 16),
              DropdownButton<String>(
                value: dropdownValueB,
                isExpanded: true,
                underline: Container(
                    height: double.parse(Provider.of<Categories>(context, listen: false).categories(accountId).length.toString()),
                    color: Colors.green
                ),
                onChanged: (String? newValue){

                  setState(() {
                    print('mudou');
                    dropdownValueB = newValue!;
                  });
                },
                items: Provider.of<Categories>(context, listen: false).categories(accountId).map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
            }).toList(),

          ),
              SizedBox(height: 16),
              DropdownButton<String>(
                value: dropdownValue,
                isExpanded: true,
                underline: Container(
                    height: 2,
                    color: Colors.green
                ),
                onChanged: (String? newValue){
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Receita', 'Despesa'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),

              )
            ],
          ),
        ),
      ),
    );
  }
}