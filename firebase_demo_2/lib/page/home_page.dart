import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;

    user.updateDisplayName("Furkan Yağmur").then(
      (value) {
        debugPrint("user.email : ${user.email}");
        debugPrint("user.displayName : ${user.displayName}");
        debugPrint("user.uid : ${user.uid}");
        debugPrint("user.phoneNumber : ${user.phoneNumber}");
        debugPrint("user.emailVerified : ${user.emailVerified}");
        
      },
    );

    return Scaffold(
      appBar: AppBar(title: Text("Ana Sayfa"),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Ana Sayfa"),
            ElevatedButton(onPressed: (){

              user.sendEmailVerification();
            }, child: Text("E-Posta doğrula"))
          ],
        ),
      ),
    );
  }
}
