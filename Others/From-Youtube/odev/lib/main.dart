import 'package:flutter/material.dart';

void main() {
  runApp(Giris());
}

class Giris extends StatelessWidget {
  const Giris({super.key});

  @override
  Widget build(BuildContext context) {
    return mainScreen();
  }
}

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    var ekranBoyutu = MediaQuery.of(context);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.asset(
                      "images/asd.jpg",
                      width: ekranBoyutu.size.width / 1.1,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("Find your food store",
                            style: TextStyle(
                                fontSize: 33, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "Siperişlerinizi her zaman ve her yerde dilediğiniz\nplatform üzerinden verebilirsiniz."),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset(
                              "images/622f95de676fccd3d9f0483b_Color Palettes Image_0314122.jpg",
                              height: 20,
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Container(
                              height: 30,
                              width: 140,
                              child: ElevatedButton(

                                  onPressed: () {

                              }, child: Text("Sipariş veriniz")),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
