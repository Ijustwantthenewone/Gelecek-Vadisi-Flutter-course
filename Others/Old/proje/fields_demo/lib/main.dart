import 'package:fields_demo/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const hi());
}

class hi extends StatelessWidget {
  const hi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
   
    );
  }
}
