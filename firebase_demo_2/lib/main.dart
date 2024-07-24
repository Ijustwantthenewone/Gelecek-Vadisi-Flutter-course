import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo_2/page/home_page.dart';
import 'package:firebase_demo_2/page/login_page.dart';
import 'package:firebase_demo_2/page/register_page.dart';
import 'package:firebase_demo_2/page/splashScreen.dart';
import 'package:flutter/material.dart';
// bu nasıl Splash screen oluyor olay zinciri ne yani o flutter logosu nasıl kayboldu ?

// tek seferlik ile anlık veri çekmeyi baştan yapar mısınız yeniden yazalım çorba gibi oldu
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
    return const MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}
