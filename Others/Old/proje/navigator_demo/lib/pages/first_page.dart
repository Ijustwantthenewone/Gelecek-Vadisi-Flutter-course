import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator_demo/pages/second_page.dart';

class first extends StatelessWidget {
  first({super.key});

  String isim = "Ahmet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink[100],
        title: const Text("1"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "second", arguments: isim);
              },
              child: const Text("İkinci Sayfa geç")),
        ],
      )),
    );
  }
}
