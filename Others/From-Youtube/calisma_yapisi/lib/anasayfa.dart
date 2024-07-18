import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/oyun_ekrani.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int sayi = 0;
  bool kontrol = false;

  @override
  void initState() {
    //25:07
    print("initState çalıştı.");
    super.initState();
  }

   Future<int> toplama(int sayi1,int sayi2)async{
      return sayi1 + sayi2;
   }


  @override
  Widget build(BuildContext context) {
    print("Build çalıştı");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anasayfa"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sonuç :$sayi"), //25:17
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    sayi += 1;
                  });
                },
                child: const Text("Tıkla")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Oyunekrani(
                                k1: Kisiler(
                                    ad: "ahmet",
                                    yas: 23,
                                    boy: 1.2,
                                    bekar: true),
                              ))).then((value) {
                    print("İts over");
                  });
                },
                child: const Text("Oyun ekranı")),
            Visibility(visible: kontrol, child: const Text("Merhaba")),
            Text(kontrol ? "Merhaba" : "!!!",
              style: TextStyle(color: kontrol ? Colors.blue : Colors.red,),),
            ((){
              if(kontrol){
                return const Text("evet");
              }else{
                return const Text("Hayır");
              }
            }()),
            ElevatedButton(onPressed: () {
              setState(() {
                kontrol = true;
              });
            }, child: const Text("Durum 1 (true)")),
            ElevatedButton(onPressed: () {
              setState(() {
                kontrol = false;
              });
            }, child: const Text("Durum 1 (false)")),
            FutureBuilder<int>(future: toplama(13, -4), builder: (context, snapshot) {
              if(snapshot.hasError){
                return const Text("HATA");
              }else if(snapshot.hasData){
                return Text("${snapshot.data}");
              }else {
                return const Text("GG");
              }
            },)

          ],
        ),
      ),
    );
  }
}
