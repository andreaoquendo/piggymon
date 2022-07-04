import 'package:flutter/material.dart';
import 'package:piggymon/data/dummy_transactions.dart';
import 'package:piggymon/db/database.dart';
import 'package:piggymon/models/record.dart';

class Transactions with ChangeNotifier{
  final Map<int, Record> _items = {...DUMMY_TRANSACTIONS};

  List<Record> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  int getRecordsCount(int accountId){
    return transactionsByAccount(accountId).length;
  }
  
  List<Record> transactionsByAccount(int accountId){
    List<Record> transacs = [];
    for(Record item in _items.values){
      if(item.accountId == accountId)
        transacs.add(item);
    }
    return transacs;
  }

  List<Record> transactionsByAccountAndCategory(int accountId, String name){
    List<Record> transacs = [];
    for(Record item in _items.values){
      if(item.accountId == accountId && item.category == name)
        transacs.add(item);
    }
    return transacs;
  }

  Record byIndexCategory(int i, int accountId, String name){
    return transactionsByAccountAndCategory(accountId, name)[i];
  }

  Record byIndex(int i, int accountId){
    return transactionsByAccount(accountId)[i];
  }

  void put(Record record) async {
    await PiggymonDatabase.instance.createRecord(record);
    await PiggymonDatabase.instance.updateCreditInfo(record.accountId, record.isExpense, record.value);
    notifyListeners();
  }

}