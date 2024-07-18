import 'package:customscrollview/model/cars.dart';
import 'package:customscrollview/views/mainScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Calistir());
}

class Calistir extends StatelessWidget {
  const Calistir({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainScreen(),
    );
  }
}
