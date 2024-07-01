import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Merhaba extends StatelessWidget {
  Merhaba({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: const Text(
          "Merhaba",
          style: TextStyle(
              fontFamily: "SeymourOne",
              fontWeight: FontWeight.w700,
              fontSize: 33),
        ),
      )),
    );
  }
}
