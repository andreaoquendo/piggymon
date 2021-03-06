import 'package:flutter/material.dart';
import 'package:piggymon/db/database.dart';
import 'package:piggymon/provider/accounts.dart';
import 'package:piggymon/routes/piggymon_routes.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    final Accounts accounts = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.green
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-mail'
                ),
                validator: (value) {

                  // var contains = accounts.contains(value.toString());
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_form.currentState!.validate()) {
                          _form.currentState?.save();
                          var userId = await PiggymonDatabase.instance.login(_formData['email'].toString(), _formData['password'].toString());
                          if(userId < 0){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('A senha est?? incorreta')),
                            );
                          } else {
                            print('accountId 1: ' + userId.toString());
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                PiggymonRoutes.MAIN_PAGE,
                                ModalRoute.withName('/'),
                                arguments: userId
                            );
                          }
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.

                        }
                      },
                      child: const Text('Entrar'),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                            Navigator.of(context).pushNamed(
                              PiggymonRoutes.SIGNUP_PAGE
                            );

                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.

                        },
                      child: const Text('Registrar-se'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}