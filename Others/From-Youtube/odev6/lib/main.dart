import 'package:flutter/material.dart';
import 'package:odev6/ui/views/anaekran.dart';

void main() {
  runApp(se());
}

class se extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true,colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),),
      home: anaEkran(),
    );
  }
}

