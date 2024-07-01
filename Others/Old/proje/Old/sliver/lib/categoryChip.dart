import 'package:flutter/material.dart';
import 'package:sliver/model/blog_model.dart';

class Merb extends StatelessWidget {
  Merb({super.key, required this.b2});
  BlogModel b2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: b2.categroyColor,
          borderRadius: BorderRadius.circular((33333))),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Text(
        b2.categoryName,
        style: TextStyle(color: Colors.white),
      ),
      margin: EdgeInsets.all(10),
    );
  }
}
