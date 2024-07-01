import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? data;
  String? selam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    final storage = await FlutterSecureStorage();
                    storage.write(key: "Costumers", value: "hi");
                    storage.write(key: "Companies", value: "Apple,Asus");
                    storage.write(key: "Countries", value: "İstanbul,İzmir");
                    Map<String, String> ornek = await storage.readAll();

                    print(ornek);
                  },
                  child: Text("Kaydet"))
            ],
          ),
        ));
  }
}
