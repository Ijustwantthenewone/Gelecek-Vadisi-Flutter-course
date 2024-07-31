import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _animaState();
}

class _animaState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? slideRightAnimation;
  Animation? color;
  Animation? aligment;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    slideRightAnimation =
        Tween<double>(begin: 0, end: 200).animate(animationController!);
    aligment =
        AlignmentTween(begin: Alignment.bottomRight, end: Alignment.topLeft)
            .animate(CurvedAnimation(
                parent: animationController!, curve: Curves.linear));
    animationController!.forward();
    color = ColorTween(begin: Colors.red, end: Colors.lightBlue).animate(
        CurvedAnimation(
            parent: animationController!,
            curve: const Interval(0.3, 0.6, curve: Curves.linear)));

    animationController!.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          animationController!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController!.forward();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween & Curve Animations"),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: animationController!,
        builder: (context, child) {
          return Align(
            alignment: aligment!.value,
            child: Container(
              height: 100,
              width: 100,
              color: color!.value,
            ),
          );
        },
      ),
    );
  }
}
