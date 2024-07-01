import 'package:flutter/material.dart';
import 'package:odev2/sayfaY.dart';

class sayfaB extends StatefulWidget{
  const sayfaB({super.key});

  @override
  State<sayfaB> createState() => _sayfaBState();
}

class _sayfaBState extends State<sayfaB> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => const sayfaY(),));
            }, child: const Text("Git Y")),
          ],
        ),
      ),
      appBar: AppBar(title: const Text("Sayfa B"),centerTitle: true,backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
    );
  }
}