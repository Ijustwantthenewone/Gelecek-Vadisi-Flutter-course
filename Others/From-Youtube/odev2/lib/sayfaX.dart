import 'package:flutter/material.dart';
import 'package:odev2/sayfaY.dart';

class sayfaX extends StatefulWidget{
  const sayfaX({super.key});

  @override
  State<sayfaX> createState() => _sayfaXState();
}

class _sayfaXState extends State<sayfaX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const sayfaY(),));
            }, child: const Text("Git y")),

          ],
        ),
      ),
      appBar: AppBar(title: const Text("Sayfa X"),centerTitle: true,backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
    );
  }
}