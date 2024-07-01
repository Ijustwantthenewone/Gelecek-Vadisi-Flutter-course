import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget {
  Header({super.key, required this.context1});

  BuildContext context1;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context1).size.height;
    double devicewidth = MediaQuery.of(context1).size.width;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.pinkAccent,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/pexels-pixabay-414667.jpg'))),
      width: devicewidth,
      height: deviceHeight / 3, // 3te bir

      child: Column(
        children: [
          SizedBox(
            height: deviceHeight / 13,
          ),
          const Text(
            "October 22, 2024",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: deviceHeight / 30,
          ),
          const Text(
            "My Todo List",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 38),
          )
        ],
      ),
    );
  }
}
