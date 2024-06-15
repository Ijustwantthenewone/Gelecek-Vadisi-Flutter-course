import 'dart:convert';

import 'package:api/model/Users.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Users> usersList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sync),
          onPressed: () async {
            getDataFromApi();
          },
        ),
        appBar: _Appbar(),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return null;
          },
        ));
  }

  AppBar _Appbar() {
    return AppBar(
      title: const Text("Lokal JSON"),
    );
  }

  // getLocalData() async {
  //   String veri =
  //       await DefaultAssetBundle.of(context).loadString("assets/users.json");

  //   List<dynamic> degisken = jsonDecode(veri);
  //   List<User> users = degisken.map((e) => User.fromJson(e)).toList();

  //   setState(() {
  //     listem = users;
  //   });
  // }

  getDataFromApi() async {
    try {
      Response cevap = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      List<dynamic> dartOldu = jsonDecode(cevap.body);

      if (cevap.statusCode == 200) {
        List<Users> evet = dartOldu
            .map(
              (e) => Users.fromJson(e),
            )
            .toList();
        setState(() {
          usersList = evet;
        });
      } else {
        print("False connection");
      }
    } catch (e) {
      print(e);
    }
  }
}
