import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets_kullanimi/anasayfa.dart';

void main() {
  runApp(const evet());
}

class evet extends StatelessWidget {
  const evet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
      debugShowCheckedModeBanner: false,
      home: const anaSayfa(),
    );
  }
}
