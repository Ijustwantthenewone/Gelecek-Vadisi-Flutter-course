import 'package:flutter/material.dart';
import 'package:todo/tasktype.dart';

Tasktype? GlobalData;

class ges extends StatefulWidget {
  ges(
      {super.key,
      required this.message,
      required this.assetim,
      required this.ts});
  String message;
  String assetim;
  Tasktype ts;

  @override
  State<ges> createState() => _gesState();
}

class _gesState extends State<ges> {
  Tasktype tasktype1 = Tasktype.colors;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 1),
              backgroundColor: Colors.deepOrange,
              content: Text("${widget.message}")));
          setState(() {
            tasktype1 = widget.ts;
          });
          print(tasktype1);
          GlobalData = tasktype1;
        },
        child: Image.asset(
          widget.assetim,
          width: devicewidth / 10,
        ));
  }
}
