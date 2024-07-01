import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColorPalettePage extends StatelessWidget {
  const ColorPalettePage({super.key});

  @override
  Widget build(BuildContext context) {
    var renkler = Colors.primaries;

    return Scaffold(
      appBar: AppBar(
        title: Text("Material Ana Renk Paleti"),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9),
        itemCount: renkler.length * 9,
        itemBuilder: (context, index) {
          var c1 = renkler[(index / 9).floor()];

          return InkWell(
            onTap: () {
              print(index.toString());
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(index.toString())));
            },
            child: Container(
              width: 11,
              height: 11,
              child: Center(child: Text((index).toString())),
              color: c1[((index % 9) + 1) * 100],
            ),
          );
        },
      ),
    );
  }

  // GridView asd() {
  //   return GridView.count(
  //     crossAxisCount: 6,
  //     children: [
  //       Container(
  //         color: Colors.amber.shade100,
  //       ),
  //       Container(
  //         color: Colors.amber.shade200,
  //       ),
  //       Container(
  //         color: Colors.amber.shade300,
  //       ),
  //       Container(
  //         color: Colors.amber.shade400,
  //       ),
  //       Container(
  //         color: Colors.amber.shade500,
  //       ),
  //       Container(
  //         color: Colors.amber.shade600,
  //       ),
  //       Container(
  //         color: Colors.amber.shade700,
  //       ),
  //       Container(
  //         color: Colors.amber.shade800,
  //       ),
  //       Container(
  //         color: Colors.amber.shade900,
  //       ),
  //       Container(
  //         color: Colors.orange.shade100,
  //       ),
  //       Container(
  //         color: Colors.orange.shade200,
  //       ),
  //       Container(
  //         color: Colors.orange[500],
  //       ),
  //     ],
  //   );
  // }
}
