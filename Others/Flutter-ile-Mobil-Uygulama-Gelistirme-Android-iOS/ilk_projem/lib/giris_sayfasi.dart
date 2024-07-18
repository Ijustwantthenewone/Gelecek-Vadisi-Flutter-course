import 'package:flutter/material.dart';
import 'package:ilk_projem/karsilama_sayfasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GirisSayfasi extends StatelessWidget {
  TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void cek() async {
      SharedPreferences s1 = await SharedPreferences.getInstance();
      int? sayi = await s1.getInt("intecır");
      List<String>? listem = await s1.getStringList("listem");

      print(sayi);
      print(listem);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Sayfası"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: t1,
            ),
            ElevatedButton(
                onPressed: () {
                  girisyapildiginda(context);
                  cek();
                },
                child: Text(
                  "Giriş yap",
                  style: TextStyle(fontSize: 24),
                ))
          ],
        ),
      ),
    );
  }

  void girisyapildiginda(BuildContext context) async {
    List<String> sehirler = ["Mehmet", "Samet", "Şaban"];
    SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.setInt("intecır", 222);
    await shared.setBool("bulyın", false);
    await shared.setStringList("listem", sehirler);

    Basildiginda(context);
  }

  void Basildiginda(BuildContext context) {
    MaterialPageRoute m1 = MaterialPageRoute(builder: (context) {
      return KarsilamaSayfasi(t1.text);
    });
    Navigator.push(context, m1);
  }
}
