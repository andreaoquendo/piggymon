import 'dart:math';
import 'package:flutter/material.dart';
import 'package:piggymon/data/dummy_categories.dart';
import 'package:piggymon/db/database.dart';
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

  Future<List<String>> categories(int accountId) async {
    return await PiggymonDatabase.instance.listCategories(accountId);
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

  void put(Category category) async {
    await PiggymonDatabase.instance.createCategory(category);
    notifyListeners();
  }

  void remove(Category category){
    _items.removeWhere((key, value) => (value.id == category.id && value.accountId == category.accountId));
    notifyListeners();
  }
}