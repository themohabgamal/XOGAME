import 'package:flutter/material.dart';
import 'package:xogame/screens/xo.dart';

class inputScreen extends StatelessWidget {
String Player1="";
String Player2="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Players Screen"),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Player 1",
            ),
            onChanged: (text) => Player1=text,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Player 2",
            ),
            onChanged: (text) => Player2=text,
          ),
          SizedBox(height: 50,),
          ElevatedButton(style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(15))),
              onPressed: (){
            Navigator.pushNamed(context, "xo",arguments:xoBoardArguments(p1: Player1,p2: Player2));
              },
              child: Text("Start the game",style: TextStyle(fontSize: 20),)),       ],
      ) ,
    );
  }
}
class xoBoardArguments {
  String p1;
  String p2;
  xoBoardArguments({required this.p1,required this.p2});
}
