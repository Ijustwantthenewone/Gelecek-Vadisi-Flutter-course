import 'package:flutter/material.dart';
import 'package:prayertimes/Pages/calendar_page.dart';
import 'package:prayertimes/Pages/prayer_times.dart';

class PageControl extends StatefulWidget {
  const PageControl({super.key});

  @override
  State<PageControl> createState() => _PageControlState();
}

class _PageControlState extends State<PageControl> {
  final PageController _pageController = PageController(initialPage: 1);
  final List<Color?> _colors = [Colors.pinkAccent, Colors.teal];
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      KeepAlivePage(child: CalendarPage(colors: _colors[_currentIndex])),
      KeepAlivePage(child: Prayertimes(color: _colors[_currentIndex])),
    ];

    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        controller: _pageController,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: _colors[_currentIndex],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            _pageController.jumpToPage(_currentIndex);
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: _colors[_currentIndex],
            icon: const Icon(Icons.calendar_month),
            label: 'Takvim',
          ),
          BottomNavigationBarItem(
            backgroundColor: _colors[_currentIndex],
            icon: const Icon(Icons.timelapse_outlined),
            label: 'Namaz',
          ),
        ],
        currentIndex: _currentIndex,
      ),
    );
  }
}

class KeepAlivePage extends StatefulWidget {
  final Widget child;

  const KeepAlivePage({super.key, required this.child});

  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
