import 'package:flutter/material.dart';

class asa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Example',
      home: Scaffold(
        appBar: AppBar(title: Text('Diagonal Move & Color Change')),
        body: Center(
          child: MovingColoredBox(),
        ),
      ),
    );
  }
}

class MovingColoredBox extends StatefulWidget {
  @override
  _MovingColoredBoxState createState() => _MovingColoredBoxState();
}

class _MovingColoredBoxState extends State<MovingColoredBox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // AnimationController'u başlatıyoruz
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Pozisyon animasyonu için Tween
    _positionAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(1, 1),
    ).animate(_controller);

    // Renk animasyonu için ColorTween
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(_controller);

    // Animasyonu sürekli tekrarlaması için ayarlıyoruz
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SlideTransition(
          position: _positionAnimation,
          child: Container(
            width: 100,
            height: 100,
            color: _colorAnimation.value,
          ),
        );
      },
    );
  }
}
