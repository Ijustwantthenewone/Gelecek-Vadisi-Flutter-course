import 'package:flutter/material.dart';
import 'package:urunler_app/data/entity/urunler.dart';

class detaySayfa extends StatefulWidget {
  Urunler urun;

  detaySayfa({required this.urun});

  @override
  State<detaySayfa> createState() => _detaySayfaState();
}

class _detaySayfaState extends State<detaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.urun.ad),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.urun.resim}"),
            Text("${widget.urun.fiyat} ₺",style: TextStyle(fontSize: 50),)
          ],
        ),
      ),
    );
  }
}
