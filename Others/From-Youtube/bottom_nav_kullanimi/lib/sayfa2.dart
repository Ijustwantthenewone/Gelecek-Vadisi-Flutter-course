import 'package:flutter/material.dart';

class sayfa2 extends StatefulWidget {
  const sayfa2({super.key});

  @override
  State<sayfa2> createState() => _sayfa2State();
}

class _sayfa2State extends State<sayfa2> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Sayfa 2",style: TextStyle(fontSize: 35,color: Colors.pinkAccent)),);
  }
}
