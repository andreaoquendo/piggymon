
import 'package:flutter/material.dart';
import 'package:piggymon/data/dummy_credit_infos.dart';
import 'package:piggymon/models/creditInfo.dart';

class CreditInfos with ChangeNotifier{
  final Map<int, CreditInfo> _items = {...DUMMY_CREDITS};

  List<CreditInfo> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  CreditInfo byIndex(int i){
    return _items.values.elementAt(i);
  }

  CreditInfo? byId(int id){
    for(CreditInfo c in _items.values){
      if(c.accountId == id) return c;
    }
    return null;
  }

  num? getSavingsGoal(int accountId){
    return _items[accountId]?.savingsGoal;
  }

  num? getTotalAvailable(int accountId){
    return _items[accountId]?.totalAvailable;
  }

  num? getOutcomes(int accountId){
    return _items[accountId]?.outcomes;
  }

  num? getIncomes(int accountId){
    return _items[accountId]?.incomes;
  }

  void put(CreditInfo c){
    if(_items.containsKey(c.accountId)){
      _items.update(c.accountId, (_) => CreditInfo(accountId: c.accountId, savingsGoal: c.savingsGoal));
    }else{
      _items.putIfAbsent(c.accountId, () => CreditInfo(
        accountId: c.accountId,
        savingsGoal: c.savingsGoal,
      ));
    }
    notifyListeners();
  }

  void remove(CreditInfo creditInfo){
    _items.remove(creditInfo.accountId);
    notifyListeners();
  }

  void update(int accountId, bool outcome, num value){
    if(outcome == true){
      _items[accountId]?.outcomes+= value;
      _items[accountId]?.totalAvailable-= value;
    }else{
      _items[accountId]?.incomes+= value;
      _items[accountId]?.totalAvailable+= value;
    }
  }
}