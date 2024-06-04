import 'package:flutter/material.dart';

class YerindeYenileme extends StatefulWidget {
  const YerindeYenileme({super.key});

  @override
  State<YerindeYenileme> createState() => _YerindeYenilemeState();
}

class _YerindeYenilemeState extends State<YerindeYenileme> {
  List<String> listem = [
    "Belt Bag",
    "Hang Top",
    "Old Fashion",
    "Office Code",
    "Feshin"
        "Belt Bag",
    "Hang Top",
    "Old Fashion",
    "Office Code",
    "Feshin"
        "Belt Bag",
    "Hang Top",
    "Old Fashion",
    "Office Code",
    "Feshin"
  ];

  int seciliDeger = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 16,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: listem.length,
        itemBuilder: _builder,
      ),
    );
  }

  Widget _builder(BuildContext context, int index) {
    Color c1 = Colors.black;
    Color c2 = Colors.grey;

    return GestureDetector(
      onTap: () {
        setState(() {
          seciliDeger = index;
        });
        print(seciliDeger);
      },
      child: Column(
        children: [
          Text(
            listem[index],
            style: TextStyle(
                fontSize: 23,
                color: seciliDeger == index ? c1 : c2,
                fontWeight: seciliDeger == index ? FontWeight.bold : null),
          ),
          Visibility(
            visible: seciliDeger == index,
            child: Container(
              width: 100,
              height: 5,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
