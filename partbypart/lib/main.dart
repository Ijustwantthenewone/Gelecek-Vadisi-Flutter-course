import 'package:flutter/material.dart';
import 'package:partbypart/bottomnav.dart';
//Merhaba Ahmet bey. Elbette, ders kaydını aşağıda iletiyoruz. İyi günler dileriz.

//Ders kaydı: https://drive.google.com/file/d/1yIFY7KtYdNrRdLJZVDKKVFKU-ehq-Hm9/view

//tabbar yapamıyorum birlikte tekrar yapabilir miyiz
void main() {
  runApp(const si());
}

class si extends StatelessWidget {
  const si({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bot(),
    );
  }
}
