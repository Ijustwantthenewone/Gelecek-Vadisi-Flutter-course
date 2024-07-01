import 'package:flutter/material.dart';
import 'package:urunler_app/ui/views/anasayfa.dart';

void main(){
  runApp(ma());
}

class ma extends StatelessWidget{
  const ma({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),useMaterial3: true),
      home: const anaSayfa(),
    );
  }
}
