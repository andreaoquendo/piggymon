import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piggymon/page/login_page.dart';
import 'package:piggymon/provider/accounts.dart';
import 'package:piggymon/provider/categories.dart';
import 'package:piggymon/provider/credit_infos.dart';
import 'package:piggymon/provider/monthly_expenses.dart';
import 'package:piggymon/provider/transactions.dart';
import 'package:piggymon/routes/piggymon_routes.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(PiggyMon());
}

class PiggyMon extends StatelessWidget {

  final title = 'Piggymon';
  final color = Color.fromRGBO(112, 156, 67, 1);

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (ctx) => MonthlyExpenses(),
      ),
      ChangeNotifierProvider(
        create: (ctx) => Categories(),
      ),
      ChangeNotifierProvider(
          create: (ctx) => Transactions()
      ),
      ChangeNotifierProvider(
        create: (ctx) => Accounts(),
      ),
      ChangeNotifierProvider(
        create: (ctx) => CreditInfos(),
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginPage(),
      onGenerateRoute: RouteGenerator.generateRoute,
    )
  );
}


