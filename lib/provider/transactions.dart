import 'dart:math';
import 'package:flutter/material.dart';
import 'package:piggymon/data/dummy_transactions.dart';
import 'package:piggymon/models/transaction.dart';

class Transactions with ChangeNotifier{
  final Map<int, Transaction> _items = {...DUMMY_TRANSACTIONS};

  List<Transaction> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Transaction byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(Transaction transaction){
    // edit
    if(_items.containsKey(transaction.id)){
      _items.update(transaction.id, (_) => Transaction(
        isExpense: transaction.isExpense,
        category: transaction.category,
        value: transaction.value
      )
      );
    }else{
      final idTransac = Random().nextInt(100);
      _items.putIfAbsent(idTransac, () => Transaction(
        idTransac: idTransac,
          isExpense: transaction.isExpense,
          category: transaction.category,
          value: transaction.value
      ));
    }
    // add
    notifyListeners();
  }

  void remove(Transaction transaction){
    _items.remove(transaction.id);
    notifyListeners();
  }
}