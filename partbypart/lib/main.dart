import 'package:flutter/material.dart';
import 'package:partbypart/bottomnav.dart';



//tabbar yapamıyorum birlikte tekrar yapabilir miyiz
void main() {
  runApp(const si());
}

class si extends StatelessWidget {
  const si({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bot(),
    );
  }
}
