import 'package:flutter/material.dart';
import 'package:yazar/model/bolum.dart';
import 'package:yazar/model/kitap.dart';
import 'package:yazar/view/bolum_detay_sayfasi.dart';
import 'package:yazar/yerel_veri_tabani.dart';

class BolumlerSayfasi extends StatefulWidget {
  final Kitap _kitap;

  BolumlerSayfasi(this._kitap, {super.key});

  @override
  State<BolumlerSayfasi> createState() => _BolumlerSayfasiState();
}

class _BolumlerSayfasiState extends State<BolumlerSayfasi> {
  YerelVeriTabani _yerelVeriTabani = YerelVeriTabani();

  List<Bolum> _bolumler = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildBolumEkleFab(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.pinkAccent,
      title: Text(
        widget._kitap.isim,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBolumEkleFab(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: const Icon(
        Icons.add,
        color: Colors.pinkAccent,
      ),
      onPressed: () {
        _bolumEkle(context);
      },
    );
  }

  void _bolumEkle(BuildContext context) async {
    String? bolumBasligi = await _pencereAc(context);
    int? kitapId = widget._kitap.id;

    if (bolumBasligi != null && kitapId != null) {
      Bolum k1 = Bolum(kitapId, bolumBasligi);
      int bolumIdsi = await _yerelVeriTabani.createBolum(k1);
      print("Bolum Idsi: $bolumIdsi");
      setState(() {});
    }
  }

  Future<String?> _pencereAc(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (context) {
        String? sonuc;
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            "Bölüm adını giriniz",
            style: TextStyle(color: Colors.pinkAccent),
          ),
          content: TextField(
            enabled: true,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: const BorderSide(color: Colors.red, width: 5)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.pinkAccent, width: 3))),
            onChanged: (String? value) {
              sonuc = value;
            },
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

  Future<void> _tumBolumleriGetir() async {
    int? kitapId = widget._kitap.id;

    if (kitapId != null) {
      _bolumler = await _yerelVeriTabani.readTumBolumler(kitapId);
    }
  }

  Widget _buildBody() {
    return FutureBuilder(
      builder: _buildListView,
      future: _tumBolumleriGetir(),
    );
  }

  Widget _buildListView(BuildContext context, AsyncSnapshot<void> snapshot) {
    return ListView.builder(
      itemBuilder: _buildListItem,
      itemCount: _bolumler.length,
    );
  }

  Widget? _buildListItem(BuildContext context, int index) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          _bolumler[index].id.toString(),
          style: const TextStyle(color: Colors.pinkAccent),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                _bolumGuncelle(index, context);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                _bolumSil(index);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              )),
        ],
      ),
      title: Text(
        _bolumler[index].baslik,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {
        _bolumDetaySayfasiniAc(context, index);
      },
    );
  }

  void _bolumGuncelle(int index, BuildContext context) async {
    String? yeniBolumBasligi = await _pencereAc(context);

    if (yeniBolumBasligi != null) {
      Bolum bolum = _bolumler[index];
      bolum.baslik = yeniBolumBasligi;
      int guncellenenSatirSayisi = await _yerelVeriTabani.updateBolum(bolum);
      if (guncellenenSatirSayisi > 0) {
        setState(() {});
      }
    }
  }

  void _bolumSil(int index) async {
    Bolum bolum = _bolumler[index];
    int silinenSatirSayisi = await _yerelVeriTabani.deleteBolum(bolum);
    if (silinenSatirSayisi > 0) {
      setState(() {});
    }
  }

  void _bolumDetaySayfasiniAc(BuildContext context, int index) {
    MaterialPageRoute p1 = MaterialPageRoute(
      builder: (context) {
        return BolumDetaySayfasi(_bolumler[index]);
      },
    );
    Navigator.push(context, p1);
  }
}
