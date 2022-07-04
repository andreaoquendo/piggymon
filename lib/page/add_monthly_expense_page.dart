import 'package:flutter/material.dart';
import 'package:piggymon/db/database.dart';
import 'package:piggymon/models/monthly_expense.dart';
import 'package:piggymon/routes/piggymon_routes.dart';

class AddMonthlyExpensePage extends StatefulWidget {

  final dynamic accountId;
  AddMonthlyExpensePage({@required this.accountId});

  @override
  _AddMonthlyExpensePage createState() => _AddMonthlyExpensePage();
}

class _AddMonthlyExpensePage extends State<AddMonthlyExpensePage>{

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  String dropdownValue = 'Receita';
  String dropdownValueB = ' ';

  late Future<List<String>> categoriesList;

  @override
  void initState(){
    super.initState();
    categoriesList = getCategories(widget.accountId);
  }

  Future<List<String>> getCategories(int accountId) async {
    return await PiggymonDatabase.instance.listCategories(accountId);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesa Mensal'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                final isValid = _form.currentState?.validate();
                if(isValid == true){
                  _form.currentState?.save();

                  var gasto = true;
                  if(dropdownValue == 'Receita') {
                    gasto = false;
                  }

                 await PiggymonDatabase.instance.createMonthlyExpense(
                      MonthlyExpense(
                        accountId: widget.accountId,
                        isExpense: gasto,
                        day: int.parse(_formData['day'].toString()),
                        name: _formData['name'].toString(),
                        value: num.parse(_formData['value'].toString()),
                      )
                  );

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      PiggymonRoutes.MONTHLY_EXPENSES_PAGE,
                      (route) => false,
                      arguments: widget.accountId
                  );
                }

              },
              icon: Icon(Icons.save)
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: categoriesList,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<String> catList = snapshot.data!;

            return Padding(
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
                          _formData['value'] = value;
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
                          height: catList.length.toDouble(),
                          color: Colors.green
                      ),
                      onChanged: (String? newValue){

                        setState(() {
                          dropdownValueB = newValue!;
                        });
                      },
                      items: catList.map<DropdownMenuItem<String>>((String value) {
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
            );
          }
          else {
            return Text('Carregando...');
          }
        }),
    );

  }
}