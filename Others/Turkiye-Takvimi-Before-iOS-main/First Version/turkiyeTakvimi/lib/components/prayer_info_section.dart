import 'package:flutter/material.dart';
import 'package:turkiyetakvimi/constant.dart';

class PrayerInfoSection extends StatefulWidget {
  PrayerInfoSection({
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
      width: MediaQuery.of(context).size.width / 1.2,
      child: Container(
        decoration: BoxDecoration(
          color: widget.isTheCurrent?Colors.red[800]:Colors.transparent,
          border: Border.all(
            width: 4,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '  ${widget.prayerTime}  ',
                style: const TextStyle(
                    fontSize: 26,
                    color: accentColor,
                    backgroundColor: Colors.transparent),
              ),
              Text(
                "${widget.prayerTimeName}  ",
                style: const TextStyle(
                  fontSize: 26,
                  color: accentColor,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
