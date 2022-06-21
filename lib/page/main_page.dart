import 'package:flutter/material.dart';
import 'package:piggymon/provider/credit_infos.dart';
import 'package:piggymon/routes/piggymon_routes.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {

  static final String title = 'PiggyMon';


  @override
  Widget build(BuildContext context){

    final accountId =  ModalRoute.of(context)?.settings.arguments as int;
    final CreditInfos creditInfos = Provider.of(context);
    var totalAvailable = creditInfos.getTotalAvailable(accountId)!;
    var sign = '';
    if(totalAvailable < 0){
      totalAvailable = totalAvailable.abs();
      sign = '-';
    }


    return Scaffold(
        drawer: NavigationDrawerWidget(accountId),
        appBar: AppBar(title: Text(title)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
                PiggymonRoutes.TRANSACTIONS_FORM,
                arguments: accountId
            );
          },
          // label: const Text('Adicionar transação'),
          child: const Icon(Icons.add),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)
                    ),
                  ),
                  padding: EdgeInsets.only(top:25, bottom:30),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: Text(

                              sign + "R\$" + totalAvailable.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 60,
                              )
                          )
                      ),
                      SizedBox(height: 10),
                      Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal:16),
                          child: Text(
                              "Saldo Atual",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              )
                          )
                      )
                    ],
                  ),

                ),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius:  BorderRadius.circular(32)
                        ),
                        color: Colors.white,
                        child: Padding(
                            padding:const EdgeInsets.all(35.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text('Sua meta deste mês é:',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: const Color(0xff47455f),
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height:15),
                                Text('R\$' + creditInfos.getSavingsGoal(accountId).toString(),
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )
                        )
                    )),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius:  BorderRadius.circular(32)
                        ),
                        color: Colors.white,
                        child: Padding(
                            padding:const EdgeInsets.all(35.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text('Seu gasto deste mês foi:',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: const Color(0xff47455f),
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height:15),
                                Text('R\$' + creditInfos.getOutcomes(accountId).toString(),
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )
                        )
                    )),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius:  BorderRadius.circular(32)
                        ),
                        color: Colors.white,
                        child: Padding(
                            padding:const EdgeInsets.all(35.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text('Seu ganho deste mês é:',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: const Color(0xff47455f),
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height:15),
                                Text('R\$' + creditInfos.getIncomes(accountId).toString(),
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )
                        )
                    )),
              ],
            )
        )
    );
  }
}