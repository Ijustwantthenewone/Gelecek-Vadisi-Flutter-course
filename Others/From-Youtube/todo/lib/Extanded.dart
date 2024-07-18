import 'package:flutter/material.dart';

class Extanded1 extends StatelessWidget {
  Extanded1({super.key, required this.yazi, required this.cont});
  String yazi;
  TextEditingController cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text("$yazi"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: TextField(
              onChanged: (value) {
                evet();
              },
              controller: cont,
              decoration:
                  const InputDecoration(filled: true, fillColor: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  void evet() {
    print(cont.text);
  }
}

class Extanded2 extends StatelessWidget {
  Extanded2({super.key, required this.yazi, required this.cont2});
  String yazi;
  TextEditingController cont2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text("$yazi"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: TextField(
              onChanged: (value) {
                evet();
              },
              controller: cont2,
              decoration:
                  const InputDecoration(filled: true, fillColor: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  void evet() {
    print(cont2.text);
  }
}
