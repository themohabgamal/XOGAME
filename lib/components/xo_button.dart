import 'package:flutter/material.dart';

class xo_button extends StatelessWidget {
String symbol;
Function onClick;
int index;
xo_button({required this.symbol,required this.onClick,required this.index});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          height: double.infinity,
          child: ElevatedButton
            (onPressed: (){
            onClick(index);
          }, child: Text("$symbol",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
          ),
        )
    );
  }
}
