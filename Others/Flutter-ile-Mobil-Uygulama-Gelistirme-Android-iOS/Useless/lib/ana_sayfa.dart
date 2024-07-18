import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iller_ve_ilceler/il.dart';
import 'package:iller_ve_ilceler/ilce.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  List<Il> iller = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Çizim bittikten sonra çağır.
      jsonCozumle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: _ogeOlustur,
        itemCount: iller.length,
      ),
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: Text("İller ve ilçeler"),
      ),
    );
  }

  List<Ilce> tumIlceler = [];

  Widget _ogeOlustur(BuildContext context, int index) {
    return Card(
      child: ExpansionTile(
        title: Text(iller[index].isim), // orta
        leading: Icon(Icons.abc_rounded), //sol
        trailing: Text(iller[index].plakaKodu), //sağ
        children: [
          /*

          iller[index].ilceler.map((evet) {
            return ListTile(
              title: Text(evet.isim),
            );
          }).toList(),
         */ 
        ],
      ),
    );
  }

  void jsonCozumle() async {
    String jsonString =
        await rootBundle.loadString("assets/iller_ilceler.json");
    Map<String, dynamic> illerMap = json.decode(jsonString);

    for (String plakaKodu in illerMap.keys) {
      //01 02 03 04
      Map<String, dynamic> ilMap = illerMap[plakaKodu];
      String ilIsmi = ilMap["name"];
      Map<String, dynamic> ilcelerMap = ilMap["districts"];

      for (String ilceKodu in ilcelerMap.keys) {
        Map<String, dynamic> ilceMap = ilcelerMap[ilceKodu];
        String ilceIsmi = ilceMap["name"];
        Ilce ilce = Ilce(ilceIsmi);
        tumIlceler.add(ilce);
      }
      Il il = Il(ilIsmi, plakaKodu, tumIlceler);
      iller.add(il);
    }
    setState(() {}); //13:22
  }
}
