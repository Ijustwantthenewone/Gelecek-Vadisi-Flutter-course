import 'dart:async';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:turkiyetakvimi/components/timer.dart';

import '../constant.dart';
import '../model/model.dart';


class Section1 extends StatefulWidget {
   Section1({
    required this.nextPrayerTime,
    required this.vakit
  });

  final String nextPrayerTime;
  final String vakit;

  @override
  State<Section1> createState() => _Section1State();
}

class _Section1State extends State<Section1> {
  Timer? timer;
  String time = '';


  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => {
        setState(
          () {
            time = Time().uptadeTime(widget.nextPrayerTime);

          },
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
           Text(
             widget.vakit,
            style:  TextStyle(
              color: Colors.red[800],
              fontSize: 30,
            ),
          ),
          Text(
            time,
            style:   TextStyle(
              color: Colors.red[800],
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
