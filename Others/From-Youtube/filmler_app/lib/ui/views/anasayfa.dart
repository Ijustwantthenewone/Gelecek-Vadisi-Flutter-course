import 'package:filmler_app/data/entity/filmler.dart';
import 'package:filmler_app/ui/views/detaySayfa.dart';
import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  Future<List<Filmler>> filmlerNesneleri() async {
    var filmler1 = <Filmler>[];
    var f1 = Filmler(id: 1, ad: "Django", resim: "django.png", fiyat: 24);
    var f2 = Filmler(
        id: 2, ad: "Interstellar", resim: "interstellar.png", fiyat: 32);
    var f3 = Filmler(id: 3, ad: "Inception", resim: "inception.png", fiyat: 16);
    var f4 = Filmler(
        id: 4,
        ad: "The Hateful Eight",
        resim: "thehatefuleight.png",
        fiyat: 28);
    var f5 =
        Filmler(id: 5, ad: "The Pianist", resim: "thepianist.png", fiyat: 18);
    var f6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda.png", fiyat: 10);
    filmler1.add(f1);
    filmler1.add(f2);
    filmler1.add(f3);
    filmler1.add(f4);
    filmler1.add(f5);
    filmler1.add(f6);
    return filmler1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Filmler")),
      body: FutureBuilder<List<Filmler>>(
        future: filmlerNesneleri(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var gelenler = snapshot.data;
            return GridView.builder(
              itemCount: gelenler!.length,
              itemBuilder: (context, index) {
                var x = gelenler[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetaySayfa(f1: x),
                      )),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("images/${x.resim}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${x.fiyat} ₺",
                                style: const TextStyle(fontSize: 20)),
                            ElevatedButton(
                                onPressed: () {
                                  print("${x.ad} Sepete eklendi");
                                },
                                child: const Text("Sepet"))
                          ],
                        )
                      ], //19:36
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.58),
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
