import 'package:flutter/material.dart';
import 'package:sliver/page/blog_list_page.dart';
import 'package:sliver/page/detail_page.dart';

import 'model/blog_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: BlogListPage());
  }
}



