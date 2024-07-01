import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  double? hesapSonucu  = 0;

  TextEditingController boy = TextEditingController();
  // textfield içerisindeki değeri okumak için
  TextEditingController kilo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vicut kitle endeksi",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            Text(
             hesapSonucu!.toStringAsFixed(2),
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: boy,
              decoration: InputDecoration(
                  label: Text("Boyunuz"),
                  suffixText: "m",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: kilo,
              decoration: InputDecoration(
                  label: Text("Kilonuz"),
                  suffixText: "kg",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _hesapla();
                },
                child: Text(
                  "Hesapla",
                  style: TextStyle(fontSize: 21),
                )),
          ],
        ),
      ),
    );
  }

  // trim() boşlukları iptal ediyor.
  _hesapla() {
    String boyText = boy.text.trim();
    String kiloText = kilo.text.trim();

    try {
      double boy = double.parse(boyText);
      double kilo = double.parse(kiloText);

      setState(() {
        hesapSonucu = kilo / (boy * boy);
        print(hesapSonucu);
      });
    } catch (e) {
      print("Bir hata oluştu ${e.toString()}");
    }
  }
}
