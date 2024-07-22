import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo_2/page/login_page.dart';
import 'package:firebase_demo_2/page/register_page.dart';
import 'package:flutter/material.dart';
//1:28:50
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: LoginPage(),
    );
  }
}