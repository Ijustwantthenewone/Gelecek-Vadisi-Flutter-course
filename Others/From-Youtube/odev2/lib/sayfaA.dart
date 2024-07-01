import 'package:flutter/material.dart';
import 'package:odev2/sayfaB.dart';

class sayfaA extends StatefulWidget{
  const sayfaA({super.key});

  @override
  State<sayfaA> createState() => _sayfaAState();
}

class _sayfaAState extends State<sayfaA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => sayfaB(),));
            }, child: const Text("Git B")),
          ],
        ),
      ),
      appBar: AppBar(title: const Text("Sayfa A"),centerTitle: true,backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
    );
  }
}