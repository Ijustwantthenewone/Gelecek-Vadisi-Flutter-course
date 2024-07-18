import 'package:flutter/material.dart';
import 'package:odev6/data/entity/filmler.dart';
import 'package:odev6/data/entity/kategoriler.dart';

class anaEkran extends StatefulWidget {
  const anaEkran({super.key});

  @override
  State<anaEkran> createState() => _anaEkranState();
}

class _anaEkranState extends State<anaEkran> {
  Future<List<Filmler>> gelenFilmler() async {
    var filmlerListesi = <Filmler>[];
    Filmler f1 = Filmler(id: 1, filminResmi: "asd1");
    Filmler f2 = Filmler(id: 2, filminResmi: "asd2");
    Filmler f3 = Filmler(id: 3, filminResmi: "asd3");
    Filmler f4 = Filmler(id: 4, filminResmi: "asd4");
    Filmler f5 = Filmler(id: 5, filminResmi: "asd5");
    Filmler f6 = Filmler(id: 6, filminResmi: "asd6");
    Filmler f7 = Filmler(id: 7, filminResmi: "asd7");
    Filmler f8 = Filmler(id: 8, filminResmi: "asd8");
    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);
    filmlerListesi.add(f7);
    filmlerListesi.add(f8);
    return filmlerListesi;
  }

  Future<List<Kategoriler>> gelenKategoriler() async {
    var xme = <Kategoriler>[];
    Kategoriler k1 = Kategoriler(id: 1, isim: "Aksiyon", resimIsmi: "checked");
    Kategoriler k2 = Kategoriler(id: 2, isim: "Gerilim", resimIsmi: "eye");
    Kategoriler k3 = Kategoriler(id: 3, isim: "Korku", resimIsmi: "favorites");
    Kategoriler k4 = Kategoriler(id: 4, isim: "Eğlence", resimIsmi: "key");
    Kategoriler k5 = Kategoriler(id: 5, isim: "Komedi", resimIsmi: "loupe");
    Kategoriler k6 =
        Kategoriler(id: 6, isim: "Hindistan", resimIsmi: "padlock");
    Kategoriler k7 = Kategoriler(id: 7, isim: "Heyecan", resimIsmi: "rss");
    Kategoriler k8 = Kategoriler(id: 8, isim: "Çocuk", resimIsmi: "trophy");
    xme.add(k1);
    xme.add(k2);
    xme.add(k3);
    xme.add(k4);
    xme.add(k5);
    xme.add(k6);
    xme.add(k7);
    xme.add(k8);
    return xme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Netflix",
          ),
          centerTitle: true),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: FutureBuilder(
              future: gelenFilmler(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var veri = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: veri!.length,
                    itemBuilder: (context, index) {
                      var vs = veri![index];
                      return SizedBox(
                        height: 200,
                        width: 130,
                        child: GestureDetector(
                          onTap: () {
                            print("Dokundun ! ${vs.id}");
                          },
                          child: Card(
                              child: Column(
                            verticalDirection: VerticalDirection.down,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/${vs.filminResmi}.jpg",
                                  fit: BoxFit.cover),
                              // Diğer kart içeriği
                            ],
                          )),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center();
                }
              },
            ),
          ),
          Expanded(
              flex: 3,
              child: FutureBuilder(
                future: gelenKategoriler(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var xqe = snapshot.data;
                    return GridView.builder(
                      itemCount: xqe!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 3),
                      itemBuilder: (context, index) {
                        var sss = xqe[index];
                        return Card(
                            color: Colors.teal,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        sss.isim,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        "iconlar/${sss.resimIsmi}.png",
                                        width: 30,
                                        height: 30,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ));
                      },
                    );
                  } else {
                    return Center();
                  }
                },
              )),
        ],
      ),
    );
  }
}
