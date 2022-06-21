import 'dart:math';

import 'package:flutter/material.dart';
import 'package:piggymon/models/creditInfo.dart';
import 'package:piggymon/models/transaction.dart';
import 'package:piggymon/provider/categories.dart';
import 'package:piggymon/provider/transactions.dart';
import 'package:piggymon/provider/credit_infos.dart';
import 'package:piggymon/routes/piggymon_routes.dart';
import 'package:provider/provider.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPage createState() => _AddTransactionPage();
}
class _AddTransactionPage extends State<AddTransactionPage>{

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  String dropdownValue = 'Receita';
  String dropdownValueB = ' ';

  @override
  Widget build(BuildContext context){

    final accountId =  ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text('Transação'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
              onPressed: (){
                final isValid = _form.currentState?.validate();
                if(isValid ==true){
                  _form.currentState?.save();
                  if(_formData['id'] == null) {
                    _formData['id'] = Random().nextInt(100).toString();
                  }

                  var gasto = true;
                  if(dropdownValue == 'Receita') {
                    gasto = false;
                  }

                  Provider.of<Transactions>(context, listen:false).put(
                    Transaction(
                      idTransac: int.parse(_formData['id'].toString()),
                      accountId: accountId,
                      value: num.parse(_formData['value'].toString()),
                      isExpense: gasto,
                      category: dropdownValueB
                    )
                  );
                  Provider.of<CreditInfos>(context, listen: false).update(accountId, gasto, num.parse(_formData['value'].toString()));

                  Navigator.of(context).pushNamedAndRemoveUntil(
                    PiggymonRoutes.MAIN_PAGE,
                    (route) => false,
                    arguments: accountId
                  );

                }
              },
              icon: Icon(Icons.save)
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['value'],
                decoration: InputDecoration(
                  labelText: 'Valor'
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Valor inválido';
                  }
                },
                onSaved: (value) {
                  if(value != null){
                    _formData['value'] = value;
                  }
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
              SizedBox(
                height: 16,
              ),
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