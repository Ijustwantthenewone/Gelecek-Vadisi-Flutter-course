import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridViewPage extends StatelessWidget {
  List<MaterialColor> colors = [Colors.red, Colors.amber];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GirdViewPage"),
      ),
    );
  }

  GridView _buildgridv() {
    return GridView.builder(
      itemCount: 5,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return Container(
          child: const Text("asd"),
        );
      },
    );
  }

  GridView _gridView() {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          maxCrossAxisExtent: 333,
          childAspectRatio: 1),
      children: [
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.orange,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.brown,
        ),
      ],
    );
  }
}
