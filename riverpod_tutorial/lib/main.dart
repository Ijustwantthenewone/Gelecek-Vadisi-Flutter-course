import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_tutorial/pages/hard.dart';

void main() {
  runApp(const ProviderScope(child: my()));
}

class my extends StatelessWidget {
  const my({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page2(),
    );
  }
}
