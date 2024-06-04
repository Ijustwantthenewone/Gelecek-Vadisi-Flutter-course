import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/user_model.dart';

class CardPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Card ve ListTile kullanimi"),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              card(),
              sao(),
              card(),
              sao(),
              card(),
              sao(),
              card(),
              sao(),
              card(),
              sao(),
              card(),
              sao(),
              card(),
              sao(),
              card(),
              sao(),
              card(),
              sao(),
              card(),
              sao(),
              card(),
              sao(),
              card(),
              sao(),
            ],
          ),
        ));
  }

  Padding sao() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        indent: 44,
        endIndent: 44,
        height: 11,
        thickness: 11,
        color: Colors.amber,
      ),
    );
  }

  Card card() {
    return Card(
      elevation: 16,
      shape:
          // RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          StadiumBorder(),
      child: ListTile(
        onTap: () {
          print("Aranıyor");
        },
        title: const Text("Ahmet Rıdvan Ordulu"),
        trailing: Text("2"),
        subtitle: Text("Öncelik"),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg"),
        ),
      ),
    );
  }
}
