import 'package:flutter/material.dart';
import 'package:xogame/components/xo_button.dart';
import 'package:xogame/screens/inputScreen.dart';

class Xo extends StatefulWidget {
  @override
  State<Xo> createState() => _XoState();
}

class _XoState extends State<Xo> {
List<String> gameBoard =["","","","","","","","","",];
int player1Score=0;
int player2Score=0;
  @override
  Widget build(BuildContext context) {
    xoBoardArguments args = ModalRoute.of(context)?.settings.arguments as xoBoardArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("xo game",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body:Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("${args.p1} : $player1Score",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                Text("${args.p2} : $player2Score",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                xo_button(symbol: gameBoard[0],onClick:onBtnClick,index:0),
                xo_button(symbol: gameBoard[1],onClick:onBtnClick,index:1),
                xo_button(symbol: gameBoard[2],onClick:onBtnClick,index:2),

              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                xo_button(symbol: gameBoard[3],onClick:onBtnClick,index:3),
                xo_button(symbol: gameBoard[4],onClick:onBtnClick,index:4),
                xo_button(symbol: gameBoard[5],onClick:onBtnClick,index:5),

              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                xo_button(symbol: gameBoard[6],onClick:onBtnClick,index:6),
                xo_button(symbol: gameBoard[7],onClick:onBtnClick,index:7),
                xo_button(symbol: gameBoard[8],onClick:onBtnClick,index:8),

              ],
            ),
          ),
        ],
      ),
    );
  }
  int counter=0;
void onBtnClick(int index){
  if(gameBoard[index].isNotEmpty)return;
  String symbol = counter % 2 == 0 ? "O":"X";
  gameBoard[index]=symbol;
  setState(() {});
  // if player 1 or 2 wins
  if(checkWinner(symbol)){
    if(symbol=="O"){
      player1Score++;
    }else{
      player2Score++;
    }
    gameBoard =["","","","","","","","","",];
    counter=0;
    setState(() {});
    return;
  }
  // draw
  if(counter==8){
    gameBoard =["","","","","","","","","",];
    counter=0;
    setState(() {});
    return;
  }
  //win

  counter++;
}
bool checkWinner(String symbol){
  for(int i=0;i<9;i+=3){
    if(gameBoard[i]==symbol && gameBoard[i+1]==symbol && gameBoard[i+2]==symbol)return true;
  }
  for(int i=0;i<3;i++){
    if(gameBoard[i]==symbol && gameBoard[i+3]==symbol && gameBoard[i+6]==symbol)return true;
  }
  if(gameBoard[0]==symbol && gameBoard[4]==symbol && gameBoard[8]==symbol)return true;
  if(gameBoard[2]==symbol && gameBoard[4]==symbol && gameBoard[6]==symbol)return true;
  return false;

}
}
