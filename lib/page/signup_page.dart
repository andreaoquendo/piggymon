import 'package:flutter/material.dart';
import 'package:piggymon/models/account.dart';
import 'package:piggymon/provider/accounts.dart';
import 'package:piggymon/routes/piggymon_routes.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    final Accounts accounts = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Nome'
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Insira um nome';
                        }
                      },
                      onSaved: (value) {
                        if(value != null){
                          _formData['firstName'] = value;
                        }
                      }
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Sobrenome'
                      ),
                      onSaved: (value) {
                        if(value != null){
                          _formData['lastName'] = value;
                        }
                      }
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: 'E-mail'
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Insira um e-mail';
                        }
                      },
                      onSaved: (value) {
                        if(value != null){
                          _formData['email'] = value;
                        }
                      }
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Senha'
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Insira uma senha';
                        }
                      },
                      onSaved: (value) {
                        if(value != null){
                          _formData['password'] = value;
                        }
                      }
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Gênero (F ou M)'
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Insira um genero';
                        }
                      },
                      onSaved: (value) {
                        if(value != null){
                          _formData['gender'] = value;
                        }
                      }
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Data de Nascimento (dd/mm/aaaa)'
                      ),
                      onSaved: (value) {
                        if(value != null){
                          _formData['birthday'] = value;
                        }
                      }
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Link de foto (opcional)'
                      ),
                      onSaved: (value) {
                        if(value != null){
                          _formData['photoLink'] = value;
                        }
                      }
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_form.currentState!.validate()) {
                          _form.currentState?.save();


                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Registrado')),
                          );

                          Navigator.of(context).pop();

                        }
                      },
                      child: const Text('Registrar-se'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}