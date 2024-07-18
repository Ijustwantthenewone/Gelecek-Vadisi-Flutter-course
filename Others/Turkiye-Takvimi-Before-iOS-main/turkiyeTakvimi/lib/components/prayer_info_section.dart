import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PrayerInfoSection extends StatefulWidget {
  PrayerInfoSection({
    super.key,
    required this.prayerTimeName,
    required this.prayerTime,
    required this.isTheCurrent,
  });

  String prayerTimeName = '';
  String prayerTime = '';
  bool isTheCurrent = false;

  @override
  State<PrayerInfoSection> createState() => _PrayerInfoSectionState();
}

class _PrayerInfoSectionState extends State<PrayerInfoSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.9,
      height: MediaQuery.of(context).size.height / 28,
      child: Container(
        decoration: BoxDecoration(
          color:
              widget.isTheCurrent ? Colors.deepOrange[200] : Colors.transparent,
          border: Border.all(
            color: Colors.black,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                widget.prayerTime,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 23,
                    color: Colors.black
                   ),
                maxLines: 2,
                minFontSize: 1,
                overflow: TextOverflow.ellipsis,
              ),
              AutoSizeText(
                ': ${widget.prayerTimeName}',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 27,color: Colors.black
             ),
                maxLines: 2,
                minFontSize: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
