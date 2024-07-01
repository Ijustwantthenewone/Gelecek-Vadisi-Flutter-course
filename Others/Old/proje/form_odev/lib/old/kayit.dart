import 'package:flutter/material.dart';

class Selam extends StatefulWidget {
  Selam({super.key});

  @override
  State<Selam> createState() => _SelamState();
}

class _SelamState extends State<Selam> {
  String? secilenSehir = "İstanbul";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              dropdownColor: Colors.green,
              icon: Icon(Icons.account_circle_sharp),
              underline: Container(
                height: 2,
                color: Colors.red,
              ),
              value: secilenSehir,
              items: const [
                DropdownMenuItem(value: "İstanbul", child: Text("İstanbul")),
                DropdownMenuItem(value: "Ankara", child: Text("Ankara")),
                DropdownMenuItem(value: "Bursa", child: Text("Bursa")),
                DropdownMenuItem(
                  child: Text("İzmir"),
                  value: "İzmir",
                ),
              ],
              onChanged: (value) {
                setState(() {
                  secilenSehir = value;
                  print("Seçilen değer $value");
                });
              },
            )
            
          ],
        ),
      ),
    );
  }
}
