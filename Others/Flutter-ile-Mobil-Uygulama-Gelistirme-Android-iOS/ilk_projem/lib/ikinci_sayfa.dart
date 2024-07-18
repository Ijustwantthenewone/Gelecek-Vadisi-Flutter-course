import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class IkinciSayfa extends StatelessWidget {
  String yaziIcerigi;
  IkinciSayfa(this.yaziIcerigi, {super.key});
  @override
  Widget build(BuildContext context) {
    void cek() async {
      SharedPreferences s1 = await SharedPreferences.getInstance();
      int? sayi = await s1.getInt("intecır");
      List<String>? listem = await s1.getStringList("listem");

      print(sayi);
      print(listem);
    }

    return WillPopScope(
      onWillPop: geributonu,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("İkinci Sayfa"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                yaziIcerigi,
                style: const TextStyle(fontSize: 36),
              ),
              const SizedBox(
                height: 23,
              ),
              ElevatedButton(
                  onPressed: () {
                    cek();

                    Navigator.pop(context, "İkinci sayfadan gelen veri");
                  },
                  child: const Text("Geri"))
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> geributonu() async {
    print("geri butonu tıklandı");
    return false;
  }
}
