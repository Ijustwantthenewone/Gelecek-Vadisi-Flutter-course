import 'package:flutter/material.dart';

class AnimationController1 extends StatefulWidget {
  const AnimationController1({super.key});

  @override
  State<AnimationController1> createState() => _AnimationController1State();
}

class _AnimationController1State extends State<AnimationController1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MovingContainer(),
      ),
    );
  }
}

class MovingContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _movingContainer();
  }
}

class _movingContainer extends State<MovingContainer>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _animationOffset;
  Animation<Color?>? _animationColor;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _animationOffset = Tween(begin: const Offset(0, 0), end: const Offset(0, 4))
        .animate(_animationController!);
    _animationColor =
        ColorTween(begin: Colors.amberAccent, end: Colors.pinkAccent)
            .animate(_animationController!);
    _animationController!.repeat(reverse: true);
  }

 

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return SlideTransition(
          position: _animationOffset!,
          child: Container(
            height: 100,
            width: 100,
            color: _animationColor!.value,
          ),
        );
      },
    );
  }
}
