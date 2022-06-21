import 'dart:math';
import 'package:flutter/material.dart';
import 'package:piggymon/data/dummy_categories.dart';
import 'package:piggymon/models/category.dart';

class Categories with ChangeNotifier{
  final Map<int, Category> _items = {...DUMMY_CATEGORIES};

  List<Category> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  List<Category> categoriesByAccount(int accountId){
    List<Category> categories = [];
    for(Category item in _items.values){
      if(item.accountId == accountId)
        categories.add(item);
    }
    return categories;
  }

  List<String> categories(int accountId){
    List<String> s = [' '];
    List<Category> c = categoriesByAccount(accountId);
    for(Category cat in c){
      s.add(cat.name);
    }
    return s;
  }

  int categoriesCount(int accountId){
    return categoriesByAccount(accountId).length;
  }

  Category byIndex(int i, int accountId){
    return categoriesByAccount(accountId)[i];
  }

  bool contains(Category category){
    for(Category c in _items.values){
      if(category.accountId == c.accountId && category.id == c.id){
        return true;
      }
    }
    return false;
  }

  void put(Category category){
    // edit
    if(contains(category)){
      _items.update(category.id, (_) => Category(accountId: category.accountId, id: category.id, name: category.name));
    }else{
      final id = Random().nextInt(100);
      _items.putIfAbsent(id, () => Category(
        accountId: category.accountId,
        id: id,
        name: category.name,
      ));
    }
    // add
    notifyListeners();
  }

  void remove(Category category){
    _items.removeWhere((key, value) => (value.id == category.id && value.accountId == category.accountId));
    notifyListeners();
  }
}