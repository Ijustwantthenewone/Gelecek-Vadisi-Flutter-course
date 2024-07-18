import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulkeler/favoriler.dart';
import 'package:ulkeler/ortak_liste.dart';
import 'package:ulkeler/ulke.dart';
import 'package:http/http.dart' as http;
import 'package:ulkeler/ulke_detay_sayfasi.dart';

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> { // 3.23
  final _apiUrl =
      "https://restcountries.com/v3.1/all?fields=name,flags,cca2,capital,region,languages,population";

  List<Ulke> _butunUlkeler = [];
  List<String> _favoriUlkeKodlari = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _favoriCek().then((value) => InternettenVerileriCek());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apbarim(context),
      body: _buildbody(),
    );
  }

  AppBar? apbarim(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              _favoriSayfasiniAc(context);
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            )),
      ],
      centerTitle: true,
      title: const Text(
        "Tum ülkeler",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.purple[800],
    );
  }

  Widget _buildbody () {
    return _butunUlkeler.isNotEmpty
        ? OrakListe(_butunUlkeler, _favoriUlkeKodlari)
        : const Center(child: CircularProgressIndicator());
  }

  void InternettenVerileriCek() async {
    Uri u1 = Uri.parse(_apiUrl);
    http.Response response = await http.get(u1);
    List<dynamic> listem = jsonDecode(response.body);

    for (int x = 0; x < listem.length; x++) {
      Map<String, dynamic> ulkeler = listem[x];
      Ulke uz = Ulke.fromMap(ulkeler);
      _butunUlkeler.add(uz);
    }
    setState(() {});
  }

  

  

  Future<void> _favoriCek() async {
    SharedPreferences s1 = await SharedPreferences.getInstance();
    List<String>? harita = await s1.getStringList("Favoriler");
    if (harita != null) {
      for (String kod in harita) {
        _favoriUlkeKodlari.add(kod);
      }
    }
  }

  void _favoriSayfasiniAc(BuildContext context) {
    MaterialPageRoute p1 = MaterialPageRoute(
      builder: (context) {
        return Favoriler(_butunUlkeler, _favoriUlkeKodlari);
      },
    );
    Navigator.push(context, p1);
  }
}
