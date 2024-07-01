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

class _botState extends State<bot> with SingleTickerProviderStateMixin {
  //Kalıp
  late TabController t1;

  int selectedItem = 1;
  final List<Widget> _pages = [
    Page1(
      key: const PageStorageKey("Page1"),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    t1 = TabController(length: _pages.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: selectedItem,
      length: 3,
      child: Scaffold(
        body: PageView(
          controller: p1,
          children: _pages,
          onPageChanged: (value) {
            setState(() {
              selectedItem = value;
              t1.index = value;
            });
          },
        ),
        appBar: _appBar(),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      bottom: TabBar(
        controller: t1,
        onTap: (value) {
          setState(() {
            selectedItem = value;
            p1.jumpToPage(selectedItem);
          });
        },
        dividerColor: Colors.transparent,
        tabs: const <Widget>[
          Tab(
            text: 'Flights',
            icon: Icon(Icons.flight),
          ),
          Tab(
            text: 'Trips',
            icon: Icon(Icons.luggage),
          ),
          Tab(
            text: 'Explore',
            icon: Icon(Icons.explore),
          ),
        ],
      ),
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
          icon: const Icon(
            Icons.add,
            color: Colors.lightBlue,
          ),
          label: "Add",
          backgroundColor: renkler[selectedItem],
        ),
        BottomNavigationBarItem(
            icon: const Icon(
              Icons.whatshot_outlined,
              color: Colors.lightBlue,
            ),
            label: "Burn",
            backgroundColor: renkler[selectedItem]),
        BottomNavigationBarItem(
            icon: const Icon(
              Icons.add_a_photo,
              color: Colors.lightBlue,
            ),
            label: "Photo",
            backgroundColor: renkler[selectedItem])
      ],
    );
  }
}
