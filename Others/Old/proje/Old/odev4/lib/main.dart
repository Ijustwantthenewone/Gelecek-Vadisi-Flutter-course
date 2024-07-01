import 'package:flutter/material.dart';
import 'package:odev4/custom_scroll_page.dart';

void main() {
  runApp(ana());
}

class ana extends StatelessWidget {
  const ana({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: customScrollPage(),
    );
  }
}
