import 'package:flutter/material.dart';
import 'package:piggymon/db/database.dart';
import 'package:piggymon/models/category.dart';
import 'package:piggymon/provider/categories.dart';
import 'package:piggymon/routes/piggymon_routes.dart';
import 'package:piggymon/widget/category_tile_widget.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  final dynamic accountId;

  CategoryPage({@required this.accountId});

  @override
  _CategoryPage createState() => _CategoryPage();
}
class _CategoryPage extends State<CategoryPage>{

  late Future<List<Category>> categoryList;

  @override
  void initState(){
    super.initState();

    categoryList = getCategories(widget.accountId);
  }

  Future<List<Category>> getCategories(int accountId) async {
    return await PiggymonDatabase.instance.readCategories(accountId);
  }

  @override
  Widget build(BuildContext context) {
    final Categories categories = Provider.of(context);

    return Scaffold(
        drawer: NavigationDrawerWidget(widget.accountId),
        appBar: AppBar(
          title: Text('Categorias'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              PiggymonRoutes.CATEGORIES_FORM,
              arguments: widget.accountId
            );
          },
          // label: const Text('Adicionar transação'),
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder<List<Category>>(
          future: categoryList,
          builder: (context, snapshot){
            if(snapshot.hasData){
              List<Category> cats = snapshot.data!;
              return ListView.builder(
                  itemCount: cats.length,
                  itemBuilder: (ctx, i) => CategoryTile(cats[i])
              );
            }else {
              return Text('Carregando...');
            }
          },
        )
    );
  }
}