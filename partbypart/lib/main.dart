import 'package:flutter/material.dart';

import 'package:partbypart/page_view.dart';

void main() {
  runApp(si());
}

class si extends StatelessWidget {
  const si({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pagev(),
    );
  }
}
