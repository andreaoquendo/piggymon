import 'package:flutter/material.dart';
import 'package:piggymon/models/category.dart';
import 'package:piggymon/provider/categories.dart';
import 'package:piggymon/routes/piggymon_routes.dart';
import 'package:provider/provider.dart';

class CategoryTile extends StatelessWidget {

  final Category category;

  const CategoryTile(this.category);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(25)
      ),
      child: ListTile(
          leading: CircleAvatar(child: Icon(Icons.more)),
          title: Text(category.name),
          contentPadding: EdgeInsets.all(16.0),
          trailing: Container(
            width: 96,
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: (){
                    Navigator.of(context).pushNamed(
                        PiggymonRoutes.CATEGORIES_FORM,
                        arguments: category
                    );
                  },),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: (){
                    Provider.of<Categories>(context, listen: false).remove(category);

                  },)
              ],
            ),
          ),

        // onLongPress
      )
    );
  }
}