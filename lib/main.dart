import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piggymon/page/add_category_page.dart';
import 'package:piggymon/page/add_monthly_expense_page.dart';
import 'package:piggymon/page/add_transaction_page.dart';
import 'package:piggymon/page/category_page.dart';
import 'package:piggymon/page/filter_page.dart';
import 'package:piggymon/page/login_page.dart';
import 'package:piggymon/page/main_page.dart';
import 'package:piggymon/page/monthly_expenses_page.dart';
import 'package:piggymon/page/profile_page.dart';
import 'package:piggymon/page/records_page.dart';
import 'package:piggymon/page/signup_page.dart';
import 'package:piggymon/provider/accounts.dart';
import 'package:piggymon/provider/categories.dart';
import 'package:piggymon/provider/credit_infos.dart';
import 'package:piggymon/provider/monthly_expenses.dart';
import 'package:piggymon/provider/transactions.dart';
import 'package:piggymon/routes/piggymon_routes.dart';
import 'package:provider/provider.dart';
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
      routes: {
        PiggymonRoutes.MONTHLY_EXPENSE_FORM: (_) => AddMonthlyExpensePage(),
        PiggymonRoutes.CATEGORIES_FORM: (_) => AddCategoryPage(),
        PiggymonRoutes.TRANSACTIONS_FORM: (_) => AddTransactionPage(),
        PiggymonRoutes.MAIN_PAGE: (_) => MainPage(),
        PiggymonRoutes.HOME: (_) => LoginPage(),
        PiggymonRoutes.PROFILE_PAGE: (_) => ProfilePage(),
        PiggymonRoutes.SIGNUP_PAGE: (_) => SignupPage(),
        PiggymonRoutes.RECORDS_PAGE: (_) => RecordsPage(),
        PiggymonRoutes.CATEGORIES_PAGE: (_) => CategoryPage(),
        PiggymonRoutes.MONTHLY_EXPENSES_PAGE: (_) => MonthlyExpensesPage(),
        PiggymonRoutes.FILTER_PAGE: (_) => FilterPage()
      },
    )
  );
}


