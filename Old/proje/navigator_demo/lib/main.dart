import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator_demo/pages/first_page.dart';
import 'package:navigator_demo/pages/routes.dart';
import 'package:navigator_demo/pages/second_page.dart';
import 'package:navigator_demo/pages/third_page.dart';

void main() {
  runApp(selam());
}

class selam extends StatelessWidget {
  selam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // routes: Routers.harita,

        // onUnknownRoute: (settings) => MaterialPageRoute(
        //   builder: (context) => Scaffold(
        //     body: Center(
        //       child: Text("Olmayan sayfa"),
        //     ),
        //   ),
        // ),

        routes: {
          "/": (context) => first(),
          "second": (context) => second(
                merhaba: 22,
              ),
          "third": (context) => third(),
        },
        
        onGenerateRoute: ((settings) {
          int yetki = 4;
          if (settings.name == "/") {
            return MaterialPageRoute(
                builder: (context) => first(), settings: settings);
          } else if (settings == "second") {
            return MaterialPageRoute(
                builder: (context) => second(
                      merhaba: 0,
                    ),
                settings: settings);
          }
        }));
  }
}
