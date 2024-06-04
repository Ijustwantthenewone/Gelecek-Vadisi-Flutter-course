import 'package:flutter/material.dart';
import 'package:popscope/pages.dart';

void main() {
  runApp(selam());
}

class selam extends StatelessWidget {
  const selam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) {
          return first();
        },
        "second": (context) {
          return second();
        }
      },
    );
  }
}
