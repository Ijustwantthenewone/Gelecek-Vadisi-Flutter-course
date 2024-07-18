import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iller_ve_ilceler/il.dart';
import 'package:iller_ve_ilceler/ilce.dart';

void main() {
  runApp(AnaUygulama());
}

class AnaUygulama extends StatefulWidget {
  @override
  State<AnaUygulama> createState() => _AnaUygulamaState();
}

class _AnaUygulamaState extends State<AnaUygulama> {
  List<Il> iller = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: iller.length,
          itemBuilder: _merhaba,
        ),
        appBar: AppBar(
          backgroundColor: Colors.limeAccent,
          title: const Text("İller ve ilçeler"),
        ),
      ),
    );
  }

  Widget? _merhaba(BuildContext context, int index) {
    return Card(
      child: ExpansionTile(
        leading: const Icon(Icons.build),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              iller[index].isim,
            ),
            SizedBox(
              width: 6,
            ),
            Text(iller[index].plakaKodu)
          ],
        ),
        children: iller[index].ilceler.map((e) {
          // map fonksiyonu listin bir fonksiyonu
          return ListTile(
            title: Text(e.isim),
          );
        }).toList(),
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      jsonCozumleme();
    });

    super.initState();
  }

  @override
  jsonCozumleme() async {
    String jsonString =
        await rootBundle.loadString("assets/iller_ilceler.json");
    Map<String, dynamic> illerMap = json.decode(jsonString);
    for (String plakaKodu in illerMap.keys) {
      // anahtarları tek tek gez
      Map<String, dynamic> ilMap = illerMap[plakaKodu]; // 01 02 03 geziyoruz
      String ilIsmi = ilMap["name"];
      Map<String, dynamic> ilcelerMap = ilMap["districts"]; //9.19
      List<Ilce> tumIlceler = [];

      for (String anahtarlar in ilcelerMap.keys) {
        Map<String, dynamic> ilceMap =
            ilcelerMap[anahtarlar]; // "name": "Aladağ"
        String ilceIsmi = ilceMap["name"];
        Ilce ilce = Ilce(ilceIsmi); //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        tumIlceler.add(ilce);
      }

      Il il = Il(ilIsmi, plakaKodu, tumIlceler);
      iller.add(il);
    }
    setState(() {});
  }
}
