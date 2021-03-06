import 'package:flutter/material.dart';
import 'package:piggymon/models/tips.dart';

class TipTile extends StatelessWidget {

  final Tips tip;

  const TipTile(this.tip);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular(25)
        ),
        child: ListTile(
            title: Text('Dica Importante!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(tip.text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,

              ),
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 25.0
            ),

        )
    );
  }
}