import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıt ol"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: "E posta"),
          ),
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(labelText: "Parola"),
          ),
          ElevatedButton(
              onPressed: () {
                _createUser();
              },
              child: const Text("Kaydol"))
        ],
      ),
    );
  }

  _createUser() async {
    String email = emailController.text;
    String password = passwordController.text;

    var xes = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    print(xes.user?.email ?? "Kullanıcı verisi eksik");
  }
}
