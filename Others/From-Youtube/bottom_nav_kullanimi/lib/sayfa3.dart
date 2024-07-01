import 'package:flutter/material.dart';

class sayfa3 extends StatefulWidget {
  const sayfa3({super.key});

  @override
  State<sayfa3> createState() => _sayfa3State();
}

class _sayfa3State extends State<sayfa3> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Sayfa 3",style: TextStyle(fontSize: 35,color: Colors.pinkAccent)),);
  }
}
