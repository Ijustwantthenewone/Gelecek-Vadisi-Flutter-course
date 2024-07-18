import 'package:filmler_app/data/entity/filmler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  Filmler f1;

  DetaySayfa({required this.f1});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(widget.f1.ad)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.f1.resim}"),
            Text("${widget.f1.fiyat} ₺",style: const TextStyle(fontSize: 40)),
          ],
        ),
      ),
    );
  }
}
