import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var jsondata;
  Future<void> loadJsonAsset() async {
    final String gelenJson = await rootBundle.loadString("assets/data.json");
    var dartaGeldi = jsonDecode(gelenJson);
    setState(() {
      jsondata = dartaGeldi;
    });
    print(dartaGeldi);
  }

  @override
  void initState() {
    loadJsonAsset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("JSON"),),
        backgroundColor: Colors.pinkAccent,
        body: Center(
          child: jsondata != null ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(jsondata["name"]),Text(jsondata["age"].toString()),Text(jsondata["email"]),
            ],
          ) : CircularProgressIndicator(), 
        ),
      ),
    );
  }
}
