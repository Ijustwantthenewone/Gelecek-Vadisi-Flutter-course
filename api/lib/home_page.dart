import 'dart:convert';

import 'package:api/model/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _Appbar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                _getDataFromFile(context);
              },
              child: const Text("Merhaba"))
        ],
      ),
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

    List<User> listem = dynamicList
        .map(
          (e) => User.fromJson(e),
        )
        .toList();
    for (int x = 0; x < listem.length; x++) {
      print(listem[x].name);
    }
  }
}
