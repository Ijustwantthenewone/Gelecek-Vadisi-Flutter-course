import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 253, 253, 253),
          body: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 33, right: 33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(55),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.cnet.com/a/img/resize/69256d2623afcbaa911f08edc45fb2d3f6a8e172/hub/2023/02/03/afedd3ee-671d-4189-bf39-4f312248fb27/gettyimages-1042132904.jpg?auto=webp&fit=crop&height=675&width=1200")))),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Bloggr",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "31 Mart 2024 Mahalli İdareler Genel Seçimleri'nde, 61 milyondan fazla seçmen, yaklaşık 207 bin sandıkta oy kullandı. 81 il, 973 ilçe ve 390 belde belediye başkanı ile 50 bin 336 muhtarın belirleneceği seçimlerde, il genel meclisi üyeliği, belediye meclis üyeliği seçimleri de yapıldı.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(255, 186, 216, 255)),
                        onPressed: () {},
                        child: Text("Selam"),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  appBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(97, 190, 190, 190),
    );
  }
}
