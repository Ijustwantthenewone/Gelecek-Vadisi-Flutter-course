import 'package:flutter/material.dart';
import 'package:odev3/ornek.dart';

void main() {
  runApp( main1());
}

class main1 extends StatelessWidget {
  const main1({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ornek(),
    );
  }
}
