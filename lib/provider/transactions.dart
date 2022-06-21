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

  int getRecordsCount(int accountId){
    return transactionsByAccount(accountId).length;
  }
  
  List<Transaction> transactionsByAccount(int accountId){
    List<Transaction> transacs = [];
    for(Transaction item in _items.values){
      if(item.accountId == accountId) 
        transacs.add(item);
    }
    return transacs;
  }

  List<Transaction> transactionsByAccountAndCategory(int accountId, String name){
    List<Transaction> transacs = [];
    for(Transaction item in _items.values){
      if(item.accountId == accountId && item.category == name)
        transacs.add(item);
    }
    return transacs;
  }

  Transaction byIndexCategory(int i, int accountId, String name){
    return transactionsByAccountAndCategory(accountId, name)[i];
  }

  Transaction byIndex(int i, int accountId){
    return transactionsByAccount(accountId)[i];
  }

  void put(Transaction transaction){
    // edit
    if(_items.containsKey(transaction.idTransac)){
      _items.update(transaction.idTransac, (_) => Transaction(
        accountId: transaction.accountId,
        isExpense: transaction.isExpense,
        category: transaction.category,
        value: transaction.value
      )
      );
    }else{
      final idTransac = Random().nextInt(500);
      _items.putIfAbsent(idTransac, () => Transaction(
          idTransac: idTransac,
          accountId: transaction.accountId,
          isExpense: transaction.isExpense,
          category: transaction.category,
          value: transaction.value
      ));
    }
    // add
    notifyListeners();
  }

  void remove(Transaction transaction){
    _items.remove(transaction.idTransac);
    notifyListeners();
  }
}