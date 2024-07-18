import 'package:flutter/material.dart';
import 'package:shoejson/MainScreen.dart';
// https://www.youtube.com/watch?v=vpFxmFl5cUk&list=LL&index=1

void main() {
  runApp(myApp()); 
}   

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}