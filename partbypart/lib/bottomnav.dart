import 'package:flutter/material.dart';
import 'package:partbypart/page1.dart';
import 'package:partbypart/page2.dart';
import 'package:partbypart/page3.dart';

class bot extends StatefulWidget {
  bot({super.key});

  @override
  State<bot> createState() => _botState();
}

List<MaterialAccentColor> renkler = [
  Colors.pinkAccent,
  Colors.tealAccent,
  Colors.amberAccent
];

class _botState extends State<bot> {
  int selectedItem = 1;
  final List<Widget> _pages = [
    Page1(
      key: PageStorageKey("Page1"),
    ),
    const Page2(
      key: PageStorageKey("Page2"),
    ),
    const Page3(
      key: PageStorageKey("Page3"),
    )
  ];
  PageController p1 = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: p1,
        children: _pages,
        onPageChanged: (value) {
          setState(() {
            selectedItem = value;
          });
        },
      ),
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("BottomNavigationBar"),
      automaticallyImplyLeading: false,
      backgroundColor: renkler[selectedItem],
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.lightBlue,
      type: BottomNavigationBarType.shifting,
      currentIndex: selectedItem,
      onTap: (index) {
        setState(() {
          selectedItem = index;
          p1.jumpToPage(selectedItem);
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
            color: Colors.lightBlue,
          ),
          label: "Add",
          backgroundColor: renkler[selectedItem],
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.whatshot_outlined,
              color: Colors.lightBlue,
            ),
            label: "Burn",
            backgroundColor: renkler[selectedItem]),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add_a_photo,
              color: Colors.lightBlue,
            ),
            label: "Photo",
            backgroundColor: renkler[selectedItem])
      ],
    );
  }
}
