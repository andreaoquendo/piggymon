import 'dart:math';

import 'package:flutter/material.dart';
import 'package:piggymon/data/dummy_users.dart';
import 'package:piggymon/models/account.dart';

class Accounts with ChangeNotifier{
  final Map<int, Account> _items = {...DUMMY_USERS};

  List<Account> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  String? getFirstName(int id){
    print(_items.keys);
    if(_items[id] != null) {
      return _items[id]?.firstName;
    }else {
      return 'palhaça';
    }
  }
  String? getLastName(int id){
    print(_items.keys);
    if(_items[id] != null) {
      return _items[id]?.lastName;
    }else {
      return '';
    }
  }

  String? getBirthday(int id){
    print(_items.keys);
    if(_items[id] != null) {
      return _items[id]?.birthday;
    }else {
      return '';
    }
  }

  String? getGender(int id){
    print(_items.keys);
    if(_items[id] != null) {
      return _items[id]?.gender;
    }else {
      return '';
    }
  }


  Account byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(Account account){
    // edit
    if(account.id != null && _items.containsKey(account.id)){
      _items.update(account.id, (_) => Account(firstName: account.firstName, lastName: account.lastName, email: account.email, password: account.password, birthday: account.birthday, gender: account.gender));
    }else{
      final id = Random().nextInt(100);
      _items.putIfAbsent(id, () => Account(
        id: id,
          firstName: account.firstName,
          lastName: account.lastName,
          email: account.email,
          password: account.password,
          birthday: account.birthday,
          gender: account.gender
      ));
    }
    // add
    notifyListeners();
  }

  bool contains(String email){

      bool flag = false;
      for(Account account in _items.values){
        if(email == account.email){
          flag = true;
          break;
        }
      }

      return flag;
   }

  int login(String email, String pwd){

    int id = -1;

    for(Account account in _items.values){
      if(email == account.email && pwd == account.password){
        id = account.id;
        break;
      }
    }
    print('login id '+ id.toString());
    return id;
  }


}