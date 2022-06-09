import 'package:flutter/material.dart';
import 'package:piggymon/models/category.dart';

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
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: (){},)
        // onLongPress
      )
    );
  }
}