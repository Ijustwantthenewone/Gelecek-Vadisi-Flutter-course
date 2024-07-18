import 'package:flutter/material.dart';
import 'package:odev2/main.dart';

class sayfaY extends StatefulWidget{
  const sayfaY({super.key});

  @override
  State<sayfaY> createState() => _sayfaYState();
}

class _sayfaYState extends State<sayfaY> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            }, child: const Text("Anasayfaya geri dön")),

          ],
        ),
      ),
      appBar: AppBar(title: const Text("Sayfa Y"),centerTitle: true,backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
    );
  }
}