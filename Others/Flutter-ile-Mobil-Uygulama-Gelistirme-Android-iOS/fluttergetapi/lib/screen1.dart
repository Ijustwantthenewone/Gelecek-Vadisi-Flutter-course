import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  Map<String, dynamic>? dataMap;
  List<dynamic>? donelistData;
  Map<String, dynamic>? naber;

  @override
  void initState() {
    super.initState();
    verileriCagir();
  }

  Future verileriCagir() async {
    int? sayi;
    Uri u1 = Uri.parse('https://reqres.in/api/users?page=2');

    http.Response response = await http.get(u1);
    var sonuc = jsonDecode(response.body); // json'ı darta çeviriyor
    if (response.statusCode == 200) {
      setState(() {
        dataMap = sonuc;
        donelistData = dataMap!["data"];
        naber = dataMap!["support"];
        print(naber!.entries);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("G E T A P I"),
      ),
      body: Center(
        child: donelistData == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: donelistData!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Image.network("${donelistData![index]["avatar"]}"),
                    ),
                    title: Text(donelistData![index]["first_name"] +
                        " " +
                        donelistData![index]["last_name"]),
                    subtitle: Text(donelistData![index]["email"] + ""),
                  );
                },
              ),
      ),
    );
  }
}
