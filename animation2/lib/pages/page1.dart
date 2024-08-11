import 'dart:math';

import 'package:animation2/pages/hero_widget.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Page1();
  }
}

class _Page1 extends State<Page1> {
  double _height = 150;
  double _width = 150;
  final List<Color> _color = [
    Colors.red,
    Colors.orange,
    Colors.black,
    Colors.purple,
  ];

  int _colorCounter = 0;

  AnimationController? a1;

  @override
  void initState() {
 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            animationobject(),
            SizedBox(
              height: 10,
            ),
            Hero(
              tag: 2,
              child: TextButton(
                  onPressed: onPressed,
                  child: Text(
                    "Update",
                    style: TextStyle(color: Colors.red),
                  )),
            )
          ],
        ),
      ),
    );
  }

  animationobject() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => myHero(),
            ));
      },
      child: Hero(
        tag: 1,
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          color: _color[_colorCounter],
          width: _height,
          height: _width,
        ),
      ),
    );
  }

  void onPressed() {
    setState(() {
      _height = Random().nextDouble() * 256;
      _width = Random().nextDouble() * 256;
      _colorCounter = Random().nextInt(4);
    });
  }
}
