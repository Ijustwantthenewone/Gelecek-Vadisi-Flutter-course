import 'dart:convert';

import 'package:api/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> listem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sync),
          onPressed: () async {
            getLocalData();
          },
        ),
        appBar: _Appbar(),
        body: ListView.builder(
          itemBuilder: (context, index) {
            User user = listem[index];
            return ListTile(
              title: Text("${listem[index].id}"),
              leading: Text("${listem[index].name}"),
            );
          },
          itemCount: listem.length,
        ));
  }

  AppBar _Appbar() {
    return AppBar(
      title: const Text("Lokal JSON"),
    );
  }

  getLocalData() async {
    String veri =
        await DefaultAssetBundle.of(context).loadString("assets/users.json");

    List<dynamic> degisken = jsonDecode(veri);
    List<User> users = degisken.map((e) => User.fromJson(e)).toList();

    setState(() {
      listem = users;
    });
  }
}
