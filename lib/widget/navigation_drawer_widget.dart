import 'package:flutter/material.dart';
import 'package:piggymon/page/profile_page.dart';
import 'package:piggymon/page/records_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromRGBO(112, 156, 67, 1),
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 48),
            buildMenuItem(
              text:'Perfil',
              icon: Icons.people,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
                text:'Histórico',
                icon: Icons.update,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
                text:'Dicas',
                icon: Icons.foggy
            )
          ],
        )
      )
    );
  }
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked
}){
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap:onClicked,
    );
  }

  void selectedItem(BuildContext context, int index){
    switch(index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfilePage()
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RecordsPage()
        ));
        break;
    }
  }