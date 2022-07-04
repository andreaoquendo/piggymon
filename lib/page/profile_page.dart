import 'package:flutter/material.dart';
import 'package:piggymon/db/database.dart';
import 'package:piggymon/models/account.dart';
import 'package:piggymon/routes/piggymon_routes.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';


class ProfilePage extends StatefulWidget {
  final dynamic accountId;

  ProfilePage({@required this.accountId});

  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage>{

  late Future<Account> account;

  @override
  void initState(){
    super.initState();

    account = getData(widget.accountId);
  }

  Future<Account> getData(int id) async {
    return await PiggymonDatabase.instance.readAccount(id);
  }

  @override
  Widget build(BuildContext context){


    return Scaffold(
        drawer: NavigationDrawerWidget(widget.accountId),
        appBar: AppBar(
          title: const Text('Perfil'),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      PiggymonRoutes.HOME,
                      ModalRoute.withName('/')
                  );
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: FutureBuilder<Account?>(
          future: account,
          builder: (context, snapshot){
            if(snapshot.hasData){
              Account ac = snapshot.data!;
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        decoration: const BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)
                          ),
                        ),
                        padding: EdgeInsets.only(top:25, bottom:30),
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Column(
                          children: <Widget>[
                            const CircleAvatar(
                                backgroundImage: NetworkImage('https://i.pinimg.com/564x/bb/e5/04/bbe504471088ce20726a635395698d89.jpg'),
                                radius:50
                            ),
                            const SizedBox(height:15),

                            Text(
                                "Bem vindo(a),",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                )
                            ),
                            Text(
                                ac.firstName,
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                )
                            )
                          ],
                        )
                    ),
                    SizedBox(height: 10),
                    _buildProfileItem('Nome', '${ac.firstName} ${ac.lastName}'),
                    _buildProfileItem('Data de Nascimento', '${ac.birthday}'),
                    _buildProfileItem('Gênero', '${ac.gender}')
                  ],
                ),
              );
            } else {
              return Text('Carregando...');
            }

          },
        ),
    );
  }
}

Widget _buildProfileItem(String item, String value){
  return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child:Text(
                      item,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(133, 133, 133, 0.3),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    padding: EdgeInsets.only(
                        bottom: 10,
                        top:10,
                        left: 15,
                        right: 15
                    ),
                    child: Text(
                        value,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18
                        )
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
  );
}