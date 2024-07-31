import 'package:flutter/material.dart';

class animation extends StatefulWidget {
  const animation({super.key});

  @override
  State<animation> createState() => _animationState();
}

class _animationState extends State<animation> with TickerProviderStateMixin {
  // mixin bütün fonksiyonları alır

  //Animasyonun temel özellikleri
  //Controller
  //Ticker
  //Animation

  AnimationController? animationController;

  @override
  void initState() {
    super
        .initState(); // alttan yukarı veriler oluşsun taşıt araba elektrikli araba şeklinde
    animationController = AnimationController(
        vsync: this,
        lowerBound: 0, // alt sınır
        upperBound: 200, // üst sınır
        duration: const Duration(seconds: 1));
    animationController!.forward(); //ileri doğru
    animationController!.addListener(
      () {
        debugPrint("Sayı ${animationController!.value}");
        setState(() {});
      },
    );
    animationController!.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          animationController!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          // dismissed başlangıç demek
          animationController!.forward();
        }
      },
    );
  }

  @override
  void dispose() {
    // state sonu olduğu için dışarıdan içeriue yani super sonda olacak
    // bu clası kaldırıyor.
    animationController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.pinkAccent,
        height: 100,
        width: animationController!.value,
        margin: EdgeInsets.only(left: animationController!.value),
      ),
    );
  }
}
