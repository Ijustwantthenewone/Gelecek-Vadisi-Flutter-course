import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ulkeler/ulke.dart';

class UlkeDetaySayfasi extends StatelessWidget {
  Ulke? u1;

  UlkeDetaySayfasi(this.u1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apbar(),
      body: selam(context),
    );
  }

  AppBar? apbar() {
    return AppBar(
      title: Text(u1!.isim),
      centerTitle: true,
    );
  }

  Widget selam(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
          ),
          bayrak(context),
          const SizedBox(
            height: 32,
          ),
          ismi()!,
          const SizedBox(
            height: 32,
          ),
          _buildTumDetaylar()
        ],
      ),
    );
  }

  Widget _buildTumDetaylar() {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Column(
        children: [
          detayRow(baslik: "Başkent", detay: u1!.baskent),
          detayRow(baslik: "Bölge", detay: u1!.bolge),
          detayRow(baslik: "Nüfus", detay: (u1!.nufus).toString()),
          detayRow(baslik: "Dil", detay: u1!.dil),
    
        ],
      ),
    );
  }

  Widget bayrak(BuildContext context) {
    return Image.network(
      u1!.bayrak,
      width: MediaQuery.sizeOf(context).width / 2,
      fit: BoxFit.fitWidth,
    );
  }

  Widget? ismi() {
    return Text(
      u1!.isim,
      style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    );
  }

  Widget detayRow({required String baslik, required String detay}) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            "$baslik : ",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
          flex: 5,
          child: Text(
            detay,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
