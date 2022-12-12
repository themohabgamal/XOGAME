import 'package:flutter/material.dart';
import 'package:xogame/screens/inputScreen.dart';
import 'package:xogame/screens/xo.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'xo',
      routes: {
        "xo": (context) => Xo(),
        "home":(context) => inputScreen(),
      },
      initialRoute: "home",
    );
  }
}



