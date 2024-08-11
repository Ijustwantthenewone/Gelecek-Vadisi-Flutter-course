import 'package:animation2/animation_controller.dart';
import 'package:animation2/pages/controller.dart';
import 'package:animation2/pages/hero_widget.dart';
import 'package:animation2/pages/page1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationController1(),
    );
  }
}
