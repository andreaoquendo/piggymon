import 'package:flutter/material.dart';
import 'package:piggymon/routes/piggymon_routes.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {

  static final String title = 'PiggyMon';


  @override
  Widget build(BuildContext context){

    final accountId =  ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
        drawer: NavigationDrawerWidget(accountId),
        appBar: AppBar(title: Text(title)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
                PiggymonRoutes.TRANSACTIONS_FORM
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
                          child: const Text(
                              "- R\$25,00",
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
                              "Você está R\$15.00 longe da sua meta para este mês.",
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
                                Text('R\$150.00',
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
                                Text('R\$150.00',
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
                                Text('R\$150.00',
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