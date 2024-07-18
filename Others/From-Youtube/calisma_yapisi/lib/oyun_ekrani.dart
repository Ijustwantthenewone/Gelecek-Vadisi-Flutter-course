import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/sonuc_ekrani.dart';
import 'package:flutter/material.dart';

class Oyunekrani extends StatefulWidget {
  Kisiler k1;
  Oyunekrani({super.key, required this.k1});

  @override
  State<Oyunekrani> createState() => _OyunekraniState();
}

class _OyunekraniState extends State<Oyunekrani> {

  Future<bool> geridonus(BuildContext context) async{
    print("Navigation ile geriye basıldı");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.nearby_off),onPressed: () {
          print("Geriye basıldı");
          Navigator.pop(context);
        },),
        title: const Text("Oyun ekranı"),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop:() => geridonus(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${widget.k1.ad} ${widget.k1.yas} ${widget.k1.boy} ${widget.k1.bekar}"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SonucEkrani(),
                        ));
                  },
                  child: const Text("Bitti")),
            ],
          ),
        ),
      ),
    );
  }
}

