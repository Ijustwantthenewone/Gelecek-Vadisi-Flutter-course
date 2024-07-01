import 'package:flutter/material.dart';
import 'package:yazar/model/bolum.dart';
import 'package:yazar/yerel_veri_tabani.dart';

class BolumDetaySayfasi extends StatelessWidget {
  final Bolum _bolum;
  BolumDetaySayfasi(this._bolum, {super.key});

  YerelVeriTabani _yerelVeriTabani = YerelVeriTabani();
  TextEditingController _icerikKontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[200],
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.pinkAccent[200],
      title: Text(_bolum.baslik),
      actions: [
        IconButton(
            onPressed: icerigikaydet,
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ))
      ],
    );
  }

  Widget _buildBody() {
    _icerikKontroller.text = _bolum.icerik;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _icerikKontroller,
        maxLines: 1111,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(33))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow, width: 7),
              borderRadius: BorderRadius.all(Radius.circular(33))),
        ),
      ),
    );
  }

  void icerigikaydet() async {
    _bolum.icerik = _icerikKontroller.text;
    await _yerelVeriTabani.updateBolum(_bolum);
  }
}
