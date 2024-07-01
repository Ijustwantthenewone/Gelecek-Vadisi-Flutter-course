import 'package:flutter/material.dart';

void main() => runApp(CustomButtonPage());

class CustomButtonPage extends StatefulWidget {
  @override
  State<CustomButtonPage> createState() => _CustomButtonPageState();
}

class _CustomButtonPageState extends State<CustomButtonPage> {
  String? seciliDeger;
  List<String> sehirler = ["İstanbul", "Ankara", "Bursa"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Custom Button Page'),
          ),
          body: Center(
            child: PopupMenuButton<String>(
              itemBuilder: (context) {
                return sehirler
                    .map((e) => PopupMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(); // toplu dönüşüme yarıyor
              },
              onSelected: (value) {
                debugPrint(value);
              },
            ),
          )),
    );
  }

  DropdownButton<String> _buildDropdownbutton() {
    return DropdownButton<String>(
      underline: Container(
        height: 5,
        color: Colors.red,
      ),
      hint: Text("Selam"),
      items: const [
        DropdownMenuItem(
          child: Text("İstanbul"),
          value: "İstanbul",
        ),
        DropdownMenuItem(
          child: Text("Ankara"),
          value: "Ankara",
        ),
        DropdownMenuItem(
          child: Text("Erzurum"),
          value: "Erzurum",
        ),
        DropdownMenuItem(
          child: Text("İzmir"),
          value: "İzmir",
        ),
        DropdownMenuItem(
          child: Text("Bursa"),
          value: "Bursa",
        ),
        DropdownMenuItem(
          child: Text("Van"),
          value: "Van",
        ),
      ],
      value: seciliDeger,
      onChanged: (deger) {
        print(seciliDeger);
        setState(() {
          seciliDeger = deger!;
        });
      },
    );
  }
}
