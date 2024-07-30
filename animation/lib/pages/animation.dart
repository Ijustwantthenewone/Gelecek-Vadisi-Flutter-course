import 'package:flutter/material.dart';

class animation extends StatefulWidget {
  const animation({super.key});

  @override
  State<animation> createState() => _animationState();
}

class _animationState extends State<animation> with TickerProviderStateMixin {
  // mixin bütün fonksiyonları alır

  AnimationController? c1;

  @override
  void initState() {
    super.initState();
    c1 = AnimationController(
        vsync: this,
        lowerBound: 10, // alt sınır
        upperBound: 100, // üst sınır
        duration: const Duration(seconds: 2));
    c1!.forward(); //ileri doğru
    c1!.addListener(
      () {
        debugPrint("Sayı ${c1!.value}");
      },
    );
    c1!.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          c1!.reverse();
        } else if (status == AnimationStatus.dismissed) { // dismissed başlangıç demek
          c1!.forward();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
