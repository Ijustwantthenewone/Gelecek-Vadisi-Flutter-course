import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:turkiyetakvimi/components/timer.dart';


class Section1 extends StatefulWidget {
  const Section1({super.key, required this.nextPrayerTime, required this.vakit});

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
      (timer) {
        setState(
          () {
            time = Time().uptadeTime(widget.nextPrayerTime);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            "${widget.vakit}ne kalan süre",
            textAlign: TextAlign.center,
            style: TextStyle(
                
                fontSize: MediaQuery.of(context).size.width / 23,color: Colors.black,),
            minFontSize: 1,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          AutoSizeText(
            time,
            textAlign: TextAlign.center,
            style: TextStyle(
                
                fontSize: MediaQuery.of(context).size.width / 23,color: Colors.black,),
            minFontSize: 1,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          
        ],
      ),
    );
  }
}
