import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo_2/page/home_page.dart';
import 'package:firebase_demo_2/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        User? user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
        }
      },
    );

    return const Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
