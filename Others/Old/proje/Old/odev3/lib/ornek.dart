import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ornek extends StatelessWidget {
  var renkler = Colors.primaries;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          centerTitle: true,
          title: const Text("Ödev"),
        ),
        body: GridView.builder(
          itemCount: renkler.length * 9, //9 length * 18 = 162 &&
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9),
          itemBuilder: (context, index) {
            var c1 = renkler[(index / 9).floor()];
            print(c1);
            return Container(
              width: 3,
              height: 3,
              color: c1[((index % 9 + 1) * 100)],
              child: Center(child: Text((index % 9).toString())),
            );
          },
        ));
  }
}
