import 'package:flutter/material.dart';
import 'package:piggymon/widget/navigation_drawer_widget.dart';

// Andrea

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: const Text('Perfil'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    body: Container(
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
                    backgroundImage: NetworkImage('https://i.pinimg.com/236x/04/cb/51/04cb51d6983405b8e44a4eb67e7d90d7.jpg'),
                    radius:50
                ),
                const SizedBox(height:15),

                Text(
                    "Bem vinda,",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    )
                ),
                Text(
                  "Anielle",
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
          _buildProfileItem("Nome:", "Anielle Olivera Silveira Passos"),
          _buildProfileItem("Gênero:", "Feminino"),
          _buildProfileItem("Aniversário:", "18/11/1998")
        ],
      ),
    )
    );
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