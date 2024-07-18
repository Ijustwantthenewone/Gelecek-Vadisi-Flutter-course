import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenutil123/page.dart';


void main() {
  runApp(const selam());
}

class selam extends StatelessWidget {
  const selam({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 915),
      child: Page1(),

      builder: (context,child) {
        return   MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      }
    );
  }
}
