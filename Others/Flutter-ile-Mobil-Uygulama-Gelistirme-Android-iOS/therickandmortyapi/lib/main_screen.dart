import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'caracter.model.dart';

class mainScreen extends StatefulWidget {
  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  List<Character1> l1 = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      InternettenCek();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text(
          "Cihan Ürtekin Project",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: _items,
        itemCount: l1.length,
      ),
    );
  }

  Future<void> InternettenCek() async {
    Uri u1 = Uri.parse("https://rickandmortyapi.com/api/character");
    http.Response r1 = await http.get(u1);
    Map<String, dynamic> haritam = jsonDecode(r1.body);
    List<dynamic> listem = haritam["results"];

    for (int sayi = 0; sayi < listem.length; sayi++) {
      Map<String, dynamic> bilgiler = listem[sayi];
      Character1 c1 = Character1.fromMap(bilgiler);
      l1.add(c1);
    }
    setState(() {});
  }

  Widget? _items(BuildContext context, int index) {
    Character1 c3 = l1[index];
    bool b1 = false;
    c3.status == "Alive" ? b1 = true : b1 = false;
    return Card(
      child: ListTile(
          title: Text(c3.name),
          subtitle: Text("${c3.species} & ${c3.status}"),
          trailing: Text("${c3.location}"),
          leading: Column(
            children: [
              CircleAvatar(
                maxRadius: 23,
                minRadius: 23,
                backgroundImage: NetworkImage("${c3.image}"),
              ),
              Container(
                decoration: BoxDecoration(
                    color: b1 ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(333)),
                width: 10,
                height: 10,
              )
            ],
          )),
    );
  }
}
