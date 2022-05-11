import 'package:flutter/material.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';
import 'package:piggymon/page/add_category_page.dart';

class CategoryPage extends StatelessWidget{
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
    body: const Center(
        child: Text('Categorias', style: const TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 3,)
    ),
  );
}