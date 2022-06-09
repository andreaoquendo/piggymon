import 'package:flutter/material.dart';
import 'package:piggymon/data/dummy_categories.dart';
import 'package:piggymon/widget/category_tile_widget.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';
import 'package:piggymon/page/add_category_page.dart';

class CategoryPage extends StatelessWidget{
  final categories = {...DUMMY_CATEGORIES};

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Categorias'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddCategoryPage()));
            },
            // label: const Text('Adicionar transação'),
            child: const Icon(Icons.add),
        ),
    body: ListView.builder(
      itemCount: categories.length,
      itemBuilder: (ctx, i) => CategoryTile(categories.values.elementAt(i))
    )
  );
}