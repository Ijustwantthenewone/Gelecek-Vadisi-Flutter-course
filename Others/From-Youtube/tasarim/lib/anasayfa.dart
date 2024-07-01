import 'package:flutter/material.dart';
import 'package:tasarim/renkler.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({
    super.key,
  });

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var ekranbilgisi = MediaQuery.of(context);
    final double ekranyuksekligi = ekranbilgisi.size.height;
    final double ekrangenisligi = ekranbilgisi.size.width;
    print("Ekran yüksekliği $ekranyuksekligi");
    print("Ekran genisliği $ekrangenisligi");

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Pizza",
              style: TextStyle(
                  color: renk2, fontFamily: "benimfontum", fontSize: ekrangenisligi / 11)),
          backgroundColor: renk1,
        ),
        body: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: ekranyuksekligi/15),
              child: Text(
                "Beef Cheese",
                style: TextStyle(
                    fontSize: 36, color: renk1, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset(
                "resimler/iStock-1222455274.webp",
                width: 180,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Chip(yazi: "Tavuk"),
                  Chip(
                    yazi: "Lahmacun",
                  ),
                  Chip(
                    yazi: "Sütlaç",
                  ),
                  Chip(
                    yazi: "Avukado",
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "20 Min",
                    style: TextStyle(
                        fontSize: 30,
                        color: renk2,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Devivery",
                    style: TextStyle(
                        fontSize: 30,
                        color: renk1,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Meat lover, get ready to meet your pizza",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: renk2),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Text(
                    "\$ 5.98",
                    style: TextStyle(
                        fontSize: 44,
                        color: renk1,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(width: ekrangenisligi/ 15,height: ekranyuksekligi/10,),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: renk3,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(9)))),
                    child: Text(
                      "Add to card",
                      style: TextStyle(color: renk2, fontSize: 18),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class Chip extends StatelessWidget {
  String yazi;

  Chip({required this.yazi});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(backgroundColor: renk3),
      child: Text(
        yazi,
        style: TextStyle(color: renk2),
      ),
    );
  }
}
//20:17