import 'package:flutter/material.dart';
import 'package:flutter_rest_api_series/screen/home.dart';

void main() {
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
   const MyApp({super.key});
 
   @override
   Widget build(BuildContext context) {
     return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
     );
   }
 }