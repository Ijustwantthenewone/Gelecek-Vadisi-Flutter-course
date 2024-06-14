import 'package:api/home_page.dart';
import 'package:flutter/material.dart';
// 25 Dakika
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomePage()
    );
  }
}