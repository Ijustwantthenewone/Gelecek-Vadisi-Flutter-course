import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class page1 extends StatefulWidget {
  page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: evet(),
    );
  }
}

AppBar _appBar() {
  return AppBar(
    backgroundColor: Colors.red,
    title: const Text("Ödev"),
    centerTitle: true,
  );
}

class evet extends StatefulWidget {
  const evet({super.key});

  @override
  State<evet> createState() => _evetState();
}

class _evetState extends State<evet> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  FocusNode f1 = FocusNode();
  String kontrol1 = "";
  String kontrol2 = "";
  String kontrol3 = "";
  bool? b1;
  final _keyim = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    f1.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _keyim,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Kullanıcı adınızı giriniz",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 22,
                ),
                TextFormField(
                  validator: (String? sego) {
                    // kontrol için
                    if (sego == null || sego.isEmpty) {
                      return "İsim boş girilemez";
                    } else if (sego.contains("@")) {
                      return "Lütfen geçerli bir değer yazınız";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    kontrol1 = newValue ?? "";
                  },
                  controller: t1,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  cursorColor: Colors.pinkAccent,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 50, right: 50),
                      labelText: "İsminizi giriniz",
                      labelStyle: TextStyle(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                          gapPadding: 35,
                          borderSide: BorderSide(color: Colors.red, width: 4),
                          borderRadius: BorderRadius.all(Radius.circular(222))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(222)),
                          borderSide:
                              BorderSide(color: Colors.pinkAccent, width: 2))),
                ),
                const SizedBox(
                  height: 22,
                ),
                const Text(
                  "Mailinizi giriniz",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 22,
                ),
                TextFormField(
                  validator: (String? sego) {
                    // kontrol için
                    if (sego == null || sego.isEmpty) {
                      return "Mail boş girilemez";
                    } else if (sego.contains("_")) {
                      return "Lütfen geçerli bir değer yazınız";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    kontrol2 = newValue ?? "";
                  },
                  controller: t2,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.pinkAccent,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 50, right: 50),
                      labelText: "Mailinizi giriniz",
                      labelStyle: TextStyle(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                          gapPadding: 35,
                          borderSide: BorderSide(color: Colors.red, width: 4),
                          borderRadius: BorderRadius.all(Radius.circular(222))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(222)),
                          borderSide:
                              BorderSide(color: Colors.pinkAccent, width: 2))),
                ),
                const SizedBox(
                  height: 22,
                ),
                const Text(
                  "Şifrenizi giriniz",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 22,
                ),
                TextFormField(
                  // kendi kendine tetiklensin mi
                  validator: (String? sego) {
                    // kontrol için
                    if (sego == null || sego.isEmpty) {
                      return "Numara bölümü boş girilemez";
                    } else if (sego.contains("@")) {
                      return "Lütfen geçerli bir değer yazınız";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    kontrol3 = newValue ?? "";
                  },
                  controller: t3,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  cursorColor: Colors.pinkAccent,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 50, right: 50),
                      labelText: "Şifrenizi giriniz",
                      labelStyle: TextStyle(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                          gapPadding: 35,
                          borderSide: BorderSide(color: Colors.red, width: 4),
                          borderRadius: BorderRadius.all(Radius.circular(222))),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(222)),
                          borderSide:
                              BorderSide(color: Colors.pinkAccent, width: 2))),
                ),
                const SizedBox(
                  height: 22,
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      b1 = _keyim.currentState!.validate();
                      if (b1!) {
                        _keyim.currentState!.save(); // Tetikleme
                        _keyim.currentState!
                            .reset(); // burada text editingi 3 kere clear oluyor ama bu olmuyor niye
                      }
                    },
                    child: const Text(
                      "Kaydet",
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 22,
                ),
                Text(
                  kontrol1,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 22,
                ),
                Text(
                  kontrol2,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 22,
                ),
                Text(
                  kontrol3,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
