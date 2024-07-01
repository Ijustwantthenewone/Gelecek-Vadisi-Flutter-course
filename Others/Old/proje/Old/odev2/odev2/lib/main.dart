import 'package:flutter/material.dart';
import 'package:odev2/ui.dart';

void main() {
  runApp(const Merhaba());
}
  class Merhaba extends StatelessWidget {
    const Merhaba({super.key});
  
    @override
    Widget build(BuildContext context) {
      return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Ui(),
      );
    }
  }