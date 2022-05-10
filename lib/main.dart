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
        body: const Center(
          child: Text('Página Inicial', style: const TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 3,)
        ),

      );
}
