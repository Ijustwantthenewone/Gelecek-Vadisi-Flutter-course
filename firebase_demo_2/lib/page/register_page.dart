import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo_2/page/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email, password;

  bool passwordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıt Ol"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                decoration: const InputDecoration(
                  hintText: "E-Postanızı giriniz.",
                  labelText: "E-Posta",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Bu alan boş bırakılamaz.";
                  } else if (!value.contains("@")) {
                    return "Lütfen geçerli bir e-posta adresi giriniz.";
                  } else if (value.length < 7) {
                    return "E-Posta adresi çok kısa";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  email = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: passwordVisible,
                autofillHints: const [AutofillHints.password],
                decoration: InputDecoration(
                  hintText: "Parolanızı giriniz.",
                  labelText: "Parola",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Bu alan boş bırakılamaz.";
                  } else if (value.length < 6) {
                    return "Parolanız en az 6 karakterden oluşmalıdır.";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  password = value;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _createUserWithEmailAndPassword(email!, password!);
                    }
                  },
                  child: const Text("Kaydol")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Zaten bir hesabın var mı?")),
            ],
          ),
        ),
      ),
    );
  }

  _createUserWithEmailAndPassword(String email, String password) async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      debugPrint("Bir hata meydana geldi! : $e");
    }
  }
}
