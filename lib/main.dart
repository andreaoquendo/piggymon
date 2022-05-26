import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piggymon/page/add_transaction_page.dart';
import 'package:piggymon/widget/button_widget.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(PiggyMon());
}

class PiggyMon extends StatelessWidget {
  static final String title = 'PiggyMon';
  final color = Color.fromRGBO(112, 156, 67, 1);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.green),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(title: Text(PiggyMon.title)),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddTransactionPage()));
            },
            // label: const Text('Adicionar transação'),
            child: const Icon(Icons.add),
        ),
        body: Column(
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
                      "Saldo Atual de Maio/2022",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )
                    )
                  )
                ],
              ),

            )
          ],
        )
      );
}
