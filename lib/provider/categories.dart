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

  Category byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(Category category){
    // edit
    if(_items.containsKey(category.id)){
      _items.update(category.id, (_) => Category(id: category.id, name: category.name));
    }else{
      final id = Random().nextInt(100);
      _items.putIfAbsent(id, () => Category(
        id: id,
        name: category.name,
      ));
    }
    // add
    notifyListeners();
  }

  void remove(Category category){
    _items.remove(category.id);
    notifyListeners();
  }
}