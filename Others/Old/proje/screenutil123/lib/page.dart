import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenutil123/appbar.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  //sw ekranın genişliği İphone 
  //sh ekranın yüksekliği İphone

  // .w  genişliğe bağlı değer değişebilen
  // .h  yüksekliğe bağlı değer değişebilen

  // .r yükseklik genislik arasındaki dengeli değer

  // .sp font için

  //height: 0.25.sh, yüzde 25 demek
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Column(
        children: [
          Text(
            "Ekran boyutları ${1.sh}:",
            style: TextStyle(fontSize: 45.sp),
          ),
          SizedBox(
            height: 6,
          ),
          Text("Ekran boyutları ${1.w}:"),
          SizedBox(
            height: 6,
          ),
          Container(
            color: Colors.red,
            height: 100.r,
            width: 100.r,
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            color: Colors.black,
            width: 0.25.sw,
            height: 111,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "Merhaba insan",
            style: TextStyle(fontSize: 25.sp),
          ),
          Text(
            "Merhaba insan",
            style: TextStyle(),
          ),
          Text("${ScreenUtil().pixelRatio}"),
        ],
      ),
    );
  }
}
