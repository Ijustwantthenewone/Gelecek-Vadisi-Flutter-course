import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/button_page.dart';
import 'package:flutter_demo/pages/card_page.dart';
import 'package:flutter_demo/pages/custom_button_page.dart';
import 'package:flutter_demo/pages/grid_view_page.dart';
import 'package:flutter_demo/pages/list_view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'pages/color_palette_page.dart';
import 'pages/custom_scroll_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData(brightness: Brightness.dark),
        title: 'Material App',
        builder: EasyLoading.init(),
        home: CustomScroll());
        
        
  }
}
