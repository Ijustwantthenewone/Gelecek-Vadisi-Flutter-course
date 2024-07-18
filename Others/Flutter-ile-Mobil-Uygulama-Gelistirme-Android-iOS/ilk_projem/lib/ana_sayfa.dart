import 'package:flutter/material.dart';
import 'package:ilk_projem/ikinci_sayfa.dart';
import 'package:ilk_projem/giris_sayfasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'karsilama_sayfasi.dart';

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  String _kullaniciadi = "";

  List<String> isimler = ["Ahmet", "Mehmet", "Samet", "Zehra", "Zeynep"];

  String secilenSehir = "Ahmet";

  @override
  void initState() {
    // ilk çalıştığında bir kere çalışırve bir daha çalışmaz
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // bu blok bittikten sonra çalışır.
      _kullaniciAdiniKontrolet(context);
    });
    super.initState();
  }

  TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: const Column(
        children: [
          
        ],
      ),
    );
  }

  

  void _kullaniciAdiniKontrolet(BuildContext context) async {
    if (_kullaniciadi.isEmpty) {
      giris(context);
    } else {
      karsilama(context);
    }
  }

  void giris(BuildContext context) {
    sayfaAc(context, GirisSayfasi());
  }

  void sayfaAc(BuildContext context, Widget s1) {
    MaterialPageRoute m1 = MaterialPageRoute(builder: (context) {
      return s1;
    });
    Navigator.push(context, m1);
  }

  void karsilama(BuildContext context) {
    sayfaAc(context, KarsilamaSayfasi(_kullaniciadi));
  }
  
}
