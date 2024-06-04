import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ilk_proje/MyWidget.dart';
import 'package:ilk_proje/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purpleAccent,
          child: const Icon(
            Icons.plus_one,
          ),
          onPressed: () {
            debugPrint("asd");
          }),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 72, 148, 158),
        title: Text(
          "İlk Uygulamam",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: MyWidget(),
    ));
  }

  Row flexible_expanted() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            width: 190,
            height: 100,
            color: Colors.amber,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: 190,
            height: 100,
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            width: 190,
            height: 100,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Center sss() {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(width: 14, color: Colors.white),
          borderRadius: BorderRadius.circular(443),
          boxShadow: [
            BoxShadow(
                color: Colors.blueAccent,
                offset: Offset(-10, -10),
                blurRadius: 6),
            BoxShadow(color: Colors.red, offset: Offset(10, 10), blurRadius: 6)
          ],
          image: const DecorationImage(
              image: const NetworkImage(
                  "https://4kwallpapers.com/images/walls/thumbs_3t/10995.jpg"),
              fit: BoxFit.scaleDown,
              repeat: ImageRepeat.repeatY),
        ),
      ),
    );
  }

  Container iciceContainer() {
    return Container(
      height: 120,
      width: 200,
      child: Container(
        child: const Text("asd"),
        color: Colors.red,
      ),
      alignment: Alignment.bottomLeft,
      color: const Color.fromARGB(255, 148, 221, 255),
    );
  }
}


