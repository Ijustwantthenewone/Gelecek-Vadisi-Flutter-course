import 'package:flutter/material.dart';

class sayfa1 extends StatefulWidget{
  const sayfa1({super.key});

  @override
  State<sayfa1> createState() => _sayfa1State();
}

class _sayfa1State extends State<sayfa1> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Sayfa 1",style: TextStyle(fontSize: 35,color: Colors.pinkAccent)),);
  }
}
