import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulkeler/ulke.dart';
import 'package:ulkeler/ulke_detay_sayfasi.dart';

class OrakListe extends StatefulWidget {
  List<Ulke> ulkeler = [];
  List<String> _favoriUlkeKodlari = [];

  OrakListe(this.ulkeler, this._favoriUlkeKodlari);

  @override
  State<OrakListe> createState() => _OrakListeState();
}

class _OrakListeState extends State<OrakListe> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: itemler,
      itemCount: widget.ulkeler.length,
    );
  }

  Widget? itemler(BuildContext context, int index) {
    Ulke ok = widget.ulkeler[index];
    
    return Card(
      child: ListTile(
        title: Text(ok.isim),
        subtitle: Text("Başkent ${ok.baskent}"),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(ok.bayrak),
        ),
        trailing: IconButton(
          highlightColor: Color.fromARGB(255, 255, 168, 162),
          onPressed: () {
            _favoriTiklandi(ok);
          },
          icon: Icon(
            widget._favoriUlkeKodlari.contains(ok.ulkeKodu)
                ? Icons.favorite
                : Icons.favorite_border,
            color: Colors.red,
          ),
        ),
        onTap: () {
          ulkeTiklandi(ok,context);
        },
      ),
    );
  }

  void ulkeTiklandi(Ulke u1,BuildContext context) {
    MaterialPageRoute p1 = MaterialPageRoute(
      builder: (context) {
        return UlkeDetaySayfasi(u1);
      },
    );
    Navigator.push(context, p1);
  }

  void _favoriTiklandi(Ulke usd) async {
    SharedPreferences s1 = await SharedPreferences.getInstance();

    if (widget._favoriUlkeKodlari.contains(usd.ulkeKodu)) {
      // içermek
      widget._favoriUlkeKodlari.remove(usd.ulkeKodu);
    } else {
      widget._favoriUlkeKodlari.add(usd.ulkeKodu);
    }
    await s1.setStringList("Favoriler", widget._favoriUlkeKodlari);

    setState(() {});
  }
}
