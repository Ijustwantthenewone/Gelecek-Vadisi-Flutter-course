import 'package:flutter/material.dart';
import 'package:ilk_projem/ana_sayfa.dart';
import 'package:ilk_projem/giris_sayfasi.dart';

void main() {
  runApp(const AnaUygulama());
}

class AnaUygulama extends StatelessWidget {
  const AnaUygulama({super.key});

  // Kalıtım
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      //Material design'e göre

      home: AnaSayfa(),
    );
  }
}
