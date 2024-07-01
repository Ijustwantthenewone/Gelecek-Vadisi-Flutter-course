import 'package:flutter/material.dart';
import 'package:form_odev/homePage.dart';
import 'package:form_odev/old/dialog.dart';
import 'package:form_odev/old/kayit.dart';
import 'package:form_odev/old/form_inputs_page.dart';
import 'package:form_odev/old/page.dart';
import 'package:form_odev/old/stepper.dart';

void main() {
  // https://drive.google.com/file/d/1jSzaaHXMzBnEE46hknDOLxUXjvHeC9EB/view
  runApp( e1());
}

class e1 extends StatelessWidget {
  const e1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stepper1(),
     
    );
  }
}
