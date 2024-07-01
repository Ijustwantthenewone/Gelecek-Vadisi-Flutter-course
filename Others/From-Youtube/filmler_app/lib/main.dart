import 'package:filmler_app/ui/views/anasayfa.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const ne());
}

class ne extends StatelessWidget{
  const ne({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true,colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),),
      debugShowCheckedModeBanner: false,
      home: const AnaSayfa(),
    );
  }
}
