import 'package:flutter/material.dart';
import 'package:yazar/model/kitap.dart';
import 'package:yazar/sabitler.dart';
import 'package:yazar/view/bolumler_sayfasi.dart';
import 'package:yazar/yerel_veri_tabani.dart';

class KitaplarSayfasi extends StatefulWidget {
  KitaplarSayfasi({super.key});

  @override
  State<KitaplarSayfasi> createState() => _KitaplarSayfasiState();
}

class _KitaplarSayfasiState extends State<KitaplarSayfasi> {
  YerelVeriTabani _yerelVeriTabani = YerelVeriTabani();

  List<Kitap> _kitaplar = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildKitapEkleFab(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.pinkAccent,
      title: const Text(
        "Kitaplar sayfası",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
      ),
      centerTitle: true,
    );
  }

  Widget _buildKitapEkleFab(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: const Icon(
        Icons.add,
        color: Colors.pinkAccent,
      ),
      onPressed: () {
        _kitapEkle(context);
      },
    );
  }

  void _kitapEkle(BuildContext context) async {
    String? kitapAdi = await _pencereAc(context);

    if (kitapAdi != null) {
      Kitap k1 = Kitap(kitapAdi, DateTime.now(),);
      int kitapIdsi = await _yerelVeriTabani.createKitap(k1);
      print("Kitap Idsi: $kitapIdsi");
      setState(() {});
    }
  }

  Future<String?> _pencereAc(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (context) {
        String? sonuc;
        int kategori = 0;
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            "Kitap adını giriniz",
            style: TextStyle(color: Colors.pinkAccent),
          ),
          content: Column(
            children: [
              TextField(
                enabled: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.pinkAccent, width: 3))),
                onChanged: (String? value) {
                  sonuc = value;
                },
              ),
              DropdownButton(
                value: kategori,
                items: Sabitler.kategoriler.keys.map(
                  (e) {
                    return DropdownMenuItem(
                      value: kategori,
                      child: Text(Sabitler.kategoriler[e] ?? ""),
                    );
                  },
                ).toList(),
                onChanged: (value) {},
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "İptal",
                  style: TextStyle(color: Colors.pinkAccent),
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context, sonuc);
                },
                child: const Text(
                  "Onayla",
                  style: TextStyle(color: Colors.pinkAccent),
                )),
          ],
        );
      },
    );
  }

  Future<void> _tumKitaplarGetir() async {
    _kitaplar = await _yerelVeriTabani.readTumKitaplar();
  }

  Widget _buildBody() {
    return FutureBuilder(
      builder: _buildListView,
      future: _tumKitaplarGetir(),
    );
  }

  Widget _buildListView(BuildContext context, AsyncSnapshot<void> snapshot) {
    return ListView.builder(
      itemBuilder: _buildListItem,
      itemCount: _kitaplar.length,
    );
  }

  Widget? _buildListItem(BuildContext context, int index) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          _kitaplar[index].id.toString(),
          style: const TextStyle(color: Colors.pinkAccent),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                _kitapGuncelle(index, context);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                _kitapSil(index);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              )),
        ],
      ),
      title: Text(
        _kitaplar[index].isim,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {
        _bolumlerSayfasiniAc(context, index);
      },
    );
  }

  void _kitapGuncelle(int index, BuildContext context) async {
    String? yeniKitapAdi = await _pencereAc(context);

    if (yeniKitapAdi != null) {
      Kitap kitap = _kitaplar[index];
      kitap.isim = yeniKitapAdi;
      int guncellenenSatirSayisi = await _yerelVeriTabani.updateKitap(kitap);
      if (guncellenenSatirSayisi > 0) {
        setState(() {});
      }
    }
  }

  void _kitapSil(int index) async {
    Kitap kitap = _kitaplar[index];
    int silinenSatirSayisi = await _yerelVeriTabani.deleteKitap(kitap);
    if (silinenSatirSayisi > 0) {
      setState(() {});
    }
  }

  void _bolumlerSayfasiniAc(BuildContext context, int index) {
    MaterialPageRoute p1 = MaterialPageRoute(
      builder: (context) {
        return BolumlerSayfasi(_kitaplar[index]);
      },
    );
    Navigator.push(context, p1);
  }
}
