
import 'package:bottom_nav_kullanimi/BottomNavigationPage.dart';
import 'package:bottom_nav_kullanimi/kullanici%20etkilesimi.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { //18:23
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),useMaterial3: true),
      home: const kullaniciEtkilesimi(),
    );
  }
}
