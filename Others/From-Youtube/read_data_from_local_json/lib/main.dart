import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(yerelJson());
}

class yerelJson extends StatefulWidget {
  @override
  State<yerelJson> createState() => _yerelJsonState();
}

class _yerelJsonState extends State<yerelJson> {
  List _items = [];

  Future<void> readJson() async {
    String response =
        await rootBundle.loadString("assets/sample.json"); //Stringe çeviriyoruz
    var data = await json.decode(response); // Sonra darta çeviriyoruz
    setState(() {
      _items = data["items"];
      print("Total number of items ${_items.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          children: [
            _items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Text(_items[index]["id"]),
                            title: Text(_items[index]["name"]),
                            subtitle: Text(_items[index]["description"]),
                          ),
                        );
                      },
                      itemCount: _items.length,
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                      readJson();
                    },
                    child: Text("Load Json"),
                  ),
          ],
        )),
        appBar: AppBar(
          backgroundColor: Colors.pink[100],
          title: Text("Load Json"),
          centerTitle: true,
        ),
      ),
    );
  }
}
