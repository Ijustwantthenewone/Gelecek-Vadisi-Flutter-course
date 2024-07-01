import 'package:flutter/material.dart';

class BlogModel {
  String imageURL;
  String categoryName;
  Color categroyColor;
  String title;
  String content;

  BlogModel(
      {required this.imageURL,
      required this.categoryName,
      required this.categroyColor,
      required this.title,
      required this.content});
}
