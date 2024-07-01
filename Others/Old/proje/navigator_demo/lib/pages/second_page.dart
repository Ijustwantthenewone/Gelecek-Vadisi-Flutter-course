import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator_demo/pages/third_page.dart';

class second extends StatelessWidget {
  second({super.key, required this.merhaba});
  int merhaba;
  String? gelenVeri;

  @override
  Widget build(BuildContext context) {
    gelenVeri = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink[100],
        title: const Text("2"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(gelenVeri!)),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(merhaba.toString())),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Geri gel")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "third");
              },
              child: const Text("Üçüncü sayfaya git")),
        ],
      )),
    );
  }
}
