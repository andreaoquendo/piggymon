import 'dart:math';

import 'package:flutter/material.dart';
import 'package:piggymon/data/dummy_monthly_expenses.dart';
import 'package:piggymon/models/monthly_expense.dart';

class MonthlyExpenses with ChangeNotifier{
  final Map<int, MonthlyExpense> _items = {...DUMMY_MONTHLY_EXPENSES};

  List<MonthlyExpense> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  MonthlyExpense byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(MonthlyExpense mExpense){
    // edit
    if(mExpense.id != null && _items.containsKey(mExpense.id)){
      _items.update(mExpense.id, (_) => MonthlyExpense(day: mExpense.day, name: mExpense.name, quantity: mExpense.quantity));
    }else{
      final id = Random().nextInt(100);
      _items.putIfAbsent(id, () => MonthlyExpense(
        id: id,
        day: mExpense.day,
        name: mExpense.name,
        quantity: mExpense.quantity,
      ));
    }
    // add
    notifyListeners();
  }

  void remove(MonthlyExpense mExpense){
    if(mExpense != null && mExpense.id != null) {
      _items.remove(mExpense.id);
      notifyListeners();
    }
  }
}