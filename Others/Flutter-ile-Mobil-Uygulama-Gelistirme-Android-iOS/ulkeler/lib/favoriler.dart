import 'package:flutter/material.dart';
import 'package:ulkeler/ortak_liste.dart';
import 'package:ulkeler/ulke.dart';

class Favoriler extends StatefulWidget {
  final List<Ulke> _butunUlkeler;
  final List<String> _favoriUlkeKodlari;

  Favoriler(this._butunUlkeler, this._favoriUlkeKodlari);

  @override
  State<Favoriler> createState() => _FavorilerState();
}

class _FavorilerState extends State<Favoriler> {
  List<Ulke> _favoriUlkeler = [];

  @override
  void initState() {
    for (Ulke u1 in widget._butunUlkeler) {
      //widget. direkt constructora ulaşmaya yarıyor.
      if (widget._favoriUlkeKodlari.contains(u1.ulkeKodu)) {
        _favoriUlkeler.add(u1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: Text("Favoriler"),
      backgroundColor: Colors.amber,
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return OrakListe(_favoriUlkeler, widget._favoriUlkeKodlari);
  }
}