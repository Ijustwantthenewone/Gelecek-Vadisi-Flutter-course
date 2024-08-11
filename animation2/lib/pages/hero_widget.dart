import 'package:flutter/material.dart';

class myHero extends StatelessWidget {
  const myHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Hero(tag: 2, child: Icon(Icons.abc))],
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 33),
        child: Container(
          alignment: Alignment.bottomLeft,
          child: Hero(
            tag: 1,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
