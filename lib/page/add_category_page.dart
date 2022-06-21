import 'dart:math';

import 'package:flutter/material.dart';
import 'package:piggymon/models/category.dart';
import 'package:piggymon/provider/categories.dart';
import 'package:provider/provider.dart';

class AddCategoryPage extends StatelessWidget{

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};



  @override
  Widget build(BuildContext context) {

    final accountId =  ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text('Categoria'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
              onPressed: (){
                final isValid = _form.currentState?.validate();
                if(isValid == true){
                  _form.currentState?.save();
                  if(_formData['id'] == null) {
                    _formData['id'] = Random().nextInt(100).toString();
                  }

                  Provider.of<Categories>(context, listen: false).put(
                    Category(
                      accountId: accountId,
                      id: int.parse(_formData['id'].toString()),
                      name: _formData['name'].toString()
                    )
                  );

                  Navigator.of(context).pop();
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
                initialValue: _formData['name'],
                decoration: InputDecoration(
                  labelText: 'Nome'
                ),
                validator: (value) {
                  if(value == null || value.isEmpty)
                    return 'Nome inválido';
                },
                onSaved: (value) {
                  if(value != null)
                    _formData['name'] = value;
                },
              )
            ],
          ),
        )
      ),
    );
  }
}