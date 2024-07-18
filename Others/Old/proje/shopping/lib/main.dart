import 'package:flutter/material.dart';
import 'package:shopping/view/mainPage.dart';

//1:20:57 https://drive.google.com/file/d/18hPR3aIkbkutNLRHkZJqmbpIPFrLcMl3/view
void main() {
  runApp(basla());
}

class basla extends StatelessWidget {
  // büyükharfle başla classlarda widgetlarda
  basla({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainPage(),
    );
  }
}
