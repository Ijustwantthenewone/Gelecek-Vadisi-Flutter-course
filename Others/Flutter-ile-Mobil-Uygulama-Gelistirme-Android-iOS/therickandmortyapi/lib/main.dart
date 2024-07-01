import 'package:flutter/material.dart';
import 'package:therickandmortyapi/main_screen.dart';

void main() {
  runApp(merhaba());
}

class merhaba extends StatelessWidget {
  const merhaba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainScreen(),
    );
  }
}
