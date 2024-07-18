import 'package:flutter/material.dart';

void main() { //13:42
  runApp(v1());
}

class v1 extends StatelessWidget {
  const v1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent)),
      debugShowCheckedModeBanner: false,
      home: anasayfa(),
    );
  }
}

class anasayfa extends StatefulWidget {
  const anasayfa({super.key});

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {

  String toplam = "0";
  List<String> ayiklanmishali = [];
  int? toplamlari = 0;
  String sonuc = "";



  @override
  Widget build(BuildContext context) {
    final ayiklanmishali = toplam.split("+");
    print(ayiklanmishali);




    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(toplam, style: TextStyle(fontSize: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        toplam = toplam + "0";


                      });
                    },
                    child: Text("0")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        toplam = toplam + "1";

                      });
                    },
                    child: Text("1")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        toplam = toplam + "2";

                      });
                    },
                    child: Text("2")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        toplam = toplam + "3";

                        setState(() {});
                      });
                    },
                    child: Text("3")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        toplam = toplam + "4";

                        setState(() {});
                      });
                    },
                    child: Text("4")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        toplam = toplam + "5";

                        setState(() {});
                      });
                    },
                    child: Text("5"))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        toplam = toplam + "6";

                        setState(() {});
                      });
                    },
                    child: Text("6")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        toplam = toplam + "7";

                        setState(() {});
                      });
                    },
                    child: Text("7")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        toplam = toplam + "8";

                        setState(() {});
                      });
                    },
                    child: Text("8")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        toplam = toplam + "9";

                        setState(() {});
                      });
                    },
                    child: Text("9"))
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 100)),
                onPressed: () {
                  setState(() {
                    toplam = toplam + "+";

                    setState(() {});
                  });
                },
                child: Text("+")),

            ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 100)),
                onPressed: () {
                  setState(() {
                    toplamlari = ayiklanmishali.fold(0, (x, t) => x!+int.parse(t));
                    toplam = toplamlari.toString();
                    print(toplamlari);
                  });

                  
                },
                child: Text("Topla")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 100)),
                onPressed: () {
                  setState(() {
                    toplam = "0";
                  });
                },
                child: Text("Sıfırla"))
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Hesap makinesi"),
        centerTitle: true,
      ),
    );
  }
}
