import 'package:flutter/material.dart';

class kullaniciEtkilesimi extends StatefulWidget {
  const kullaniciEtkilesimi({super.key});

  @override
  State<kullaniciEtkilesimi> createState() => _kullaniciEtkilesimiState();
}

class _kullaniciEtkilesimiState extends State<kullaniciEtkilesimi> {
  var yaziKontrolcu = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Etkileşim"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: const Text("Silmek istiyor musunuz ?"),
                    action: SnackBarAction(
                      label: "Evet",
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content: Text("asd")));
                      },
                    ),
                  ));
                },
                child: const Text("Snackbar ")),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: const Text("Silmek istiyor musunuz ?"),
                    action: SnackBarAction(
                      label: "Evet",
                      textColor: Colors.black,
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            "asd",
                            style: TextStyle(color: Colors.red),
                          ),
                          backgroundColor: Colors.yellow,
                        ));
                      },
                    ),
                  ));
                },
                child: const Text("Snackbar (Özel)")),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Merhaba"),
                        content: const Text("asd"),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("sd"))
                        ],
                      );
                    },
                  );
                },
                child: const Text("Alert")),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Merhaba"),
                        content: TextField(
                          controller: yaziKontrolcu,
                          decoration:
                              const InputDecoration(hintText: "Giriniz"),
                        ),
                        backgroundColor: Colors.grey,
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                print("Girilen değer ${yaziKontrolcu.text}"); //16:24
                                Navigator.pop(context);
                                yaziKontrolcu.text = "";
                              },
                              child: const Text("sd"))
                        ],
                      );
                    },
                  );
                },
                child: const Text("Alert (özel)")),
          ],
        ),
      ),
    );
  }
}
