import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class PiggymonRoutes {

  static const HOME = '/login_page';
  static const MONTHLY_EXPENSE_FORM = '/add_monthly_expense_page';
  static const CATEGORIES_FORM = '/add_category_page';
  static const TRANSACTIONS_FORM = 'add_transaction_page';
  static const MAIN_PAGE = '/main_page';
  static const PROFILE_PAGE = '/profile_page';
  static const SIGNUP_PAGE = '/signup_page';
  static const RECORDS_PAGE ='/records_page';
  static const CATEGORIES_PAGE = 'category_page';
  static const MONTHLY_EXPENSES_PAGE = '/monthly_expenses_page';
  static const FILTER_PAGE = '/filter_page';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name) {
      case PiggymonRoutes.HOME:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case PiggymonRoutes.MONTHLY_EXPENSE_FORM:
        return MaterialPageRoute(builder: (context) => AddMonthlyExpensePage(
          accountId: args,
        ));
      case PiggymonRoutes.CATEGORIES_FORM:
        return MaterialPageRoute(builder: (context) => AddCategoryPage(
          accountId: args,
        ));
      case PiggymonRoutes.TRANSACTIONS_FORM:
        return MaterialPageRoute(builder: (context) => AddTransactionPage(
          accountId: args,
        ));
      case PiggymonRoutes.MAIN_PAGE:
        return MaterialPageRoute(builder: (context) => MainPage(
          accountId: args,
        ));
      case PiggymonRoutes.PROFILE_PAGE:
        return MaterialPageRoute(builder: (context) => ProfilePage(
          accountId: args,
        ));
      case PiggymonRoutes.SIGNUP_PAGE:
        return MaterialPageRoute(builder: (context) => SignupPage());
      case PiggymonRoutes.RECORDS_PAGE:
        return MaterialPageRoute(builder: (context) => RecordsPage(
          accountId: args,
        ));
      case PiggymonRoutes.CATEGORIES_PAGE:
        return MaterialPageRoute(builder: (context) => CategoryPage(
          accountId: args,
        ));
      case PiggymonRoutes.MONTHLY_EXPENSES_PAGE:
        return MaterialPageRoute(builder: (context) => MonthlyExpensesPage(
          accountId: args
        ));
      case PiggymonRoutes.FILTER_PAGE:
        return MaterialPageRoute(builder: (context) => FilterPage(
          category: args,
        ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context){
      return Scaffold(
        appBar: AppBar(
          title: Text('ERROR'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Page not found!'),
        ),
      );
    });
  }
}