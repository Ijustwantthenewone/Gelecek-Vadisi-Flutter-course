import 'package:bottom_nav_kullanimi/sayfa1.dart';
import 'package:bottom_nav_kullanimi/sayfa2.dart';
import 'package:bottom_nav_kullanimi/sayfa3.dart';
import 'package:flutter/material.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int seciliIndex = 2;
  var sayfalarListesi = [const sayfa1(),const sayfa2(),const sayfa3()];
  @override
  Widget build(BuildContext context) {
      appBar: AppBar(title: const Text("Bottom Navigation"),);
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Navigation Bar"),backgroundColor: Colors.red,centerTitle: true),
      body: sayfalarListesi[seciliIndex],
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.looks_one),label: "1"),
        BottomNavigationBarItem(icon: Icon(Icons.looks_two_sharp),label: "2"),
        BottomNavigationBarItem(icon: Icon(Icons.looks_3),label: "3"),
      ],
        currentIndex: seciliIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.orange,
        backgroundColor: Colors.blue,
        onTap: (value) {
          setState(() {
            seciliIndex = value;
          });
        },
      ),
    );
  }
}
