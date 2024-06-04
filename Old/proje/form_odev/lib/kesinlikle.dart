import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Kesinlikle extends StatelessWidget {
  const Kesinlikle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: const Text(
          "Kesinlikle",
          style: TextStyle(
              fontFamily: "SeymourOne",
              fontWeight: FontWeight.w700,
              fontSize: 33),
        ),
      )),
    );
  }
}
