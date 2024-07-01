import 'dart:convert';

import 'package:api/model/Users.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sync),
          onPressed: () async {},
        ),
        appBar: _Appbar(),
        body: FutureBuilder(
          future: getDataFromApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _listeBuilder(snapshot.data!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  ListView _listeBuilder(List<Users> userList) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("${userList[index].title}"),
          leading: CircleAvatar(
            child: Text("${userList[index].id}"),
          ),
        );
      },
      itemCount: userList.length,
    );
  }

  AppBar _Appbar() {
    return AppBar(
      title: const Text("Lokal JSON"),
    );
  }

  Future<List<Users>?> getDataFromApi() async {
    Response cevap =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    List<dynamic> dartOldu = jsonDecode(cevap.body);

    if (cevap.statusCode == 200) {
      List<Users> evet = dartOldu
          .map(
            (e) => Users.fromJson(e),
          )
          .toList();
      return evet;
    } else {
      print("False connection");
      return null;
    }
  }
}
