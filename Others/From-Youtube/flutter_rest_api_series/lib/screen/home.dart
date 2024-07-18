import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          Map usersAll = users[index];
          Map name = usersAll["name"];
          String isim = name["title"];
          String isim2 = name["first"];
          String isim3 = name["last"];
          String Isim123 = "${isim} ${isim2} ${isim3}"; //https://www.youtube.com/watch?v=-48PDXzVefI&list=PLzzqaVSUiaXttx1fDaWxn_28ZlF5SMpt4&index=2
          Map resimler = usersAll["picture"];
          String picture = resimler["thumbnail"];

          return ListTile(
            leading: CircleAvatar(
              child: Text((index + 1).toString()),
              backgroundColor: Colors.yellowAccent,
            ),
            title: Text(Isim123),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                picture,
              ),
            ),
            subtitle: Text(usersAll["email"]),
          );
        },
      ),
      appBar: _appBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellowAccent,
        onPressed: onPressed,
        child: Icon(Icons.featured_play_list),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.yellowAccent,
      title: Text("Rest API Call"),
    );
  }

  void onPressed() async {
    print("fetchUsers called");
    String url = "https://randomuser.me/api/?results=70";
    Uri u1 = Uri.parse(url);
    http.Response r1 = await http.get(u1);
    Map<String, dynamic> i1 = jsonDecode(r1.body);
    users = i1["results"];
    setState(() {});
    print("Fetch Completed");
  }
}
