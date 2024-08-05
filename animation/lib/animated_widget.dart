import 'dart:math';

import 'package:flutter/material.dart';

class he extends StatefulWidget {
  const he({super.key});

  @override
  State<he> createState() => _heState();
}

class _heState extends State<he> {
  bool isRed = true;

  double sayi = 0.0;
  bool isFlipped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isRed = !isRed;
                    });
                  },
                  child: Text("Dokun")),
              AnimatedContainer(
                height: 100,
                width: 100,
                duration: const Duration(seconds: 3),
                color: isRed ? Colors.red : Colors.blue,
              ),
              AnimatedCrossFade(
                  firstChild: Text("asd"),
                  secondChild: FlutterLogo(),
                  crossFadeState: isRed
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: Duration(seconds: 1)),
              SizedBox(
                height: 20,
              ),
              Transform.translate(
                offset: Offset(sayi * 222, sayi),
                child: Container(
                  color: Colors.greenAccent,
                  height: 100,
                  width: 100,
                ),
              ),
              Slider(
                min: 0,
                max: 200,
                value: sayi,
                onChanged: (value) {
                  setState(() {
                    sayi = value;
                  });
                },
              ),
              Transform.scale(
                scale: sayi / 23,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.pink,
                ),
              ),
              LinearProgressIndicator(
                value: sayi,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFlipped = !isFlipped;
                  });
                },
                child: Transform.flip(
                  flipX: isFlipped, // Yatay olarak ters çevir
                  flipY: isFlipped,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: Center(
                      child: Text('BESESESE'),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Transform.flip(
                  flipY: sayi > 100,
                  flipX: sayi > 100,
                  child: Transform.scale(
                    scale: sayi / 100,
                    child: Container(
                      color: Colors.blue,
                      width: 100,
                      height: 100,
                      child: Text("FLUTTER"),
                    ),
                  ),
                ),
              ),
              Slider(
                min: 0.0,
                max: 200,
                value: sayi,
                onChanged: (value) {
                  setState(() {
                    sayi = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
