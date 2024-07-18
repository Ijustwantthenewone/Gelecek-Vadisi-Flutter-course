import 'package:flutter/material.dart';
import 'package:form_odev/kesinlikle.dart';
import 'package:form_odev/merhaba.dart';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int selectedItem = 0;

  List<dynamic> pageList = [
    Merhaba(),
    Kesinlikle(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          width: 300,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  onDetailsPressed: () {},
                  currentAccountPicture: Image.network(
                      "https://cdn.evrimagaci.org/q0-4ffcpiHlsmEHyfYCcYQBWPNg=/storage.evrimagaci.org%2Fold%2Fmi_media%2Fafcae823e61eefb077e1f223594b1e7f.jpeg"),
                  accountName: const Text("Ahmet Rıdvan"),
                  accountEmail: const Text("Ahmet@gmail.com")),
              const ListTile(
                title: Text("Merhaba"),
              ),
              SwitchListTile(
                value: true,
                title: const Text("Değiştir"),
                onChanged: (value) {},
              )
            ],
          ),
        ),
        appBar: AppBar(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedItem,
          onTap: (value) {
            setState(() {
              selectedItem = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.accessibility_outlined),
              label: "Merhaba",
              activeIcon: Icon(Icons.zoom_out_map),
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.yellow,
                icon: Icon(Icons.account_balance_rounded),
                label: "Kesinlikle",
                tooltip: "Evet"),
          ],
        ),
        body: pageList[selectedItem]);
  }
}
