import 'package:flutter/material.dart';
import 'package:piggymon/models/category.dart';
import 'package:piggymon/provider/categories.dart';
import 'package:piggymon/routes/piggymon_routes.dart';
import 'package:provider/provider.dart';

class AddCategoryPage extends StatefulWidget{
  final dynamic accountId;

  AddCategoryPage({@required this.accountId});

  @override
  _AddCategoryPage createState() => _AddCategoryPage();
}

class _AddCategoryPage extends State<AddCategoryPage>{

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {

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

                  Provider.of<Categories>(context, listen: false).put(
                    Category(
                      accountId: widget.accountId,
                      name: _formData['name'].toString()
                    )
                  );

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      PiggymonRoutes.CATEGORIES_PAGE,
                      (route) => false,
                      arguments: widget.accountId
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