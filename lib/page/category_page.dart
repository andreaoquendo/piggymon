import 'package:flutter/material.dart';
import 'package:piggymon/provider/categories.dart';
import 'package:piggymon/routes/piggymon_routes.dart';
import 'package:piggymon/widget/category_tile_widget.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    final Categories categories = Provider.of(context);

    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Categorias'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              PiggymonRoutes.CATEGORIES_FORM
            );
          },
          // label: const Text('Adicionar transação'),
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: categories.count,
            itemBuilder: (ctx, i) => CategoryTile(categories.byIndex(i))
        )
    );
  }
}