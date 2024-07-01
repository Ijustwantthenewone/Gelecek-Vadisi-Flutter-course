import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController e1 = TextEditingController();
  TextEditingController p1 = TextEditingController();
  FocusNode f1 = FocusNode();
  int emailFieldMaxLine = 1;

  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    f1.addListener(
      () {
        setState(() {
          if (f1.hasFocus) {
            emailFieldMaxLine = 5;
          } else {
            emailFieldMaxLine = 1;
          }
        });
      },
    );
    super.initState(); //neden initstate içine
  }

  @override
  String password = "asd";
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(focusColor: Colors.yellow),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Field Demo"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey, //
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    focusNode: f1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "E posta alanını kontrol ediniz";
                      } else if (!value.contains("@")) {
                        //!value değilse
                        return "Lütfen geçerli bir e posta adresi giriniz";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      print("Yazıldı $newValue");
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        bool isValide = _formKey.currentState!.validate();
                        if (isValide) {
                          _formKey.currentState!.reset();
                          _formKey.currentState!.save();

                          print("Kaydedildi");
                        }
                      },
                      child: const Text("Form kaydet"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField decoratedTextField() {
    return const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(22),
        labelText: "Merhaba",
        hintText: "Evet",
        focusedBorder: OutlineInputBorder(
            gapPadding: 11,
            borderRadius: const BorderRadius.all(Radius.circular(222)),
            borderSide: BorderSide(width: 2)),
      ),
    );
  }
}

//                 Padding(
//                   padding: const EdgeInsets.all(64.0).copyWith(
//                       top: 1), // değişmesini istediğini sağa yazıyorsun
//                   child: decoratedTextField(),
//                 ),