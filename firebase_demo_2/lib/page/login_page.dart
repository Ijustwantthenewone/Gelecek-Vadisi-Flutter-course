import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo_2/page/home_page.dart';
import 'package:firebase_demo_2/page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;

  bool passwordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giriş Yap"),
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
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.sendPasswordResetEmail(
                        email: "gelecekvadisiorg@gmail.com");
                  },
                  child: const Text("Şifremi unuttum"),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _signInWithEmailAndPassword(email!, password!);
                  }
                },
                child: const Text("Giriş Yap"),
              ),
              const Text("Veya şununla oturum aç"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      _SignWithGoogle();
                    },
                    icon: Image.asset(
                      "assets/google.png",
                      width: 44,
                    )),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: const Text("Henüz bir hesabın yok mu?")),
              TextButton(
                  onPressed: () async {
                    await GoogleSignIn().signOut();
                    print("Çıkış yapıldı");
                  },
                  child: const Text("Çıkış yap")),
            ],
          ),
        ),
      ),
    );
  }

  _signInWithEmailAndPassword(String email, String password) async {
    try {
      FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // AuthCredential(providerId: providerId, signInMethod: signInMethod)

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      debugPrint("Bir hata meydana geldi! : $e");
    }
  }

  void _SignWithGoogle() async {
    GoogleSignInAccount? account = await GoogleSignIn().signIn(); // burada hata alıyorum //1:06:56
    if (account != null) {
      var googleAuth = await account.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }
}
