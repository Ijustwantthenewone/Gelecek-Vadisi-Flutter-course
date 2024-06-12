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
  List<User>? userList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sync),
          onPressed: () {
            _getDataFromApi();
          },
        ),
        appBar: _Appbar(),
        body: FutureBuilder(
          future: Future.delayed(Duration(seconds: 1)),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              return _buildlistView();
            }
          },
        ));
  }

  ListView _buildlistView() {
    return ListView.builder(
      itemCount: userList?.length ?? 0, //userList? null
      itemBuilder: (context, index) {
        User user = userList![index];
        return ListTile(
          leading: CircleAvatar(
            child: Text((user.id.toString())),
          ),
          title: Text(user.name!),
          subtitle: Text(user.name!),
        );
      },
    );
  }

  AppBar _Appbar() {
    return AppBar(
      title: const Text("Lokal JSON"),
    );
  }

  _getDataFromFile(BuildContext context) async {
    String userString =
        await DefaultAssetBundle.of(context).loadString("assets/users.json");
    List dynamicList = jsonDecode(userString); //maplar var

    userList = dynamicList
        .map(
          (e) => User.fromJson(e),
        )
        .toList();
    setState(() {});
  }

  Future<List<User>?> _getDataFromApi() async {
    Response response = await http.post(
        Uri.parse("https://jsonplaceholder.typicode.com/users"),
        headers: {
          "Content-type": "application/json",
        });
    if (response.statusCode == 200) {
      String userString = response.body;

      List dynamicList = jsonDecode(userString); //maplar var

      userList = dynamicList
          .map(
            (e) => User.fromJson(e),
          )
          .toList();
      setState(() {});
      return userList!;
    }
    
  }
}
