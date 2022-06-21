import 'package:flutter/material.dart';
import 'package:piggymon/page/category_page.dart';
import 'package:piggymon/page/monthly_expenses_page.dart';
import 'package:piggymon/page/profile_page.dart';
import 'package:piggymon/page/records_page.dart';
import 'package:piggymon/page/tips_page.dart';
import 'package:piggymon/main.dart';
import 'package:piggymon/routes/piggymon_routes.dart';

class NavigationDrawerWidget extends StatelessWidget {

  NavigationDrawerWidget(this.accountId);

  final int accountId;
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
            color: Colors.green, //Color.fromRGBO(112, 156, 67, 1),
            child: ListView(
              padding: padding,
              children: <Widget>[
                const SizedBox(height: 48),
                buildMenuItem(
                  text: 'Página Inicial',
                  icon: Icons.catching_pokemon,
                  onClicked: () => selectedItem(context, 0, accountId),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Perfil',
                  icon: Icons.people,
                  onClicked: () => selectedItem(context, 1, accountId),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Histórico',
                  icon: Icons.update,
                  onClicked: () => selectedItem(context, 2, accountId),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Dicas',
                  icon: Icons.lightbulb_outlined,
                  //icon: Icons.foggy,
                  onClicked: () => selectedItem(context, 3, accountId),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Despesas Mensais',
                  icon: Icons.calendar_month_outlined,
                  onClicked: () => selectedItem(context, 4, accountId),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Categorias',
                  icon: Icons.interests_outlined,
                  onClicked: () => selectedItem(context, 5, accountId),
                ),
              ],
            )));
  }
}

Widget buildMenuItem(
    {required String text, required IconData icon, VoidCallback? onClicked}) {
  final color = Colors.white;
  final hoverColor = Colors.white70;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index, int accountId) {
  Navigator.of(context).pop();

  print('item selecionado' + accountId.toString());

  switch (index) {
    case 0:
      Navigator.of(context).pushNamed(
        PiggymonRoutes.MAIN_PAGE,
        arguments: accountId
      );
      break;
    case 1:
      Navigator.of(context).pushNamed(
        PiggymonRoutes.PROFILE_PAGE,
        arguments: accountId
      );
      break;
    case 2:
      Navigator.of(context).pushNamed(
          PiggymonRoutes.RECORDS_PAGE,
          arguments: accountId
      );
      break;
    case 3:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => TipsPage()));
      break;
    case 4:
      Navigator.of(context).pushNamed(
        PiggymonRoutes.MONTHLY_EXPENSES_PAGE,
        arguments: accountId
      );
      break;
    case 5:
      Navigator.of(context).pushNamed(
        PiggymonRoutes.CATEGORIES_PAGE,
        arguments: accountId
      );
      break;
  }
}
