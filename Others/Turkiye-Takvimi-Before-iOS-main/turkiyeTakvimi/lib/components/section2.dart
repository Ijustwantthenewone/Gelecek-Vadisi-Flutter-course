import 'package:flutter/material.dart';
import 'package:turkiyetakvimi/components/prayer_info_section.dart';

import 'my_divider.dart';

class Section2 extends StatefulWidget {
  String israk;
  String israkVakti;
  String dahve;
  String dahveVakti;
  String kerahet;
  String kerahetVakti;
  String gunes;
  String gunesVakti;
  String imsak;
  String imsakVakti;
  String sabah;
  String sabahVakti;
  String ogle;
  String ogleVakti;
  String ikindi;
  String ikindiVakti;
  String asrisani;
  String asrisaniVakti;

  String isfirar;
  String isfirarVakti;

  String aksam;
  String aksamVakti;
  String istibak;
  String istibakVakti;
  String yatsi;
  String yatsiVakti;
  String isaisani;
  String isaisaniVakti;
  String geceyarisi;
  String geceyarisiVakti;
  String teheccud;
  String teheccudVakti;
  String seher;
  String seherVakti;
  String kible;
  String kibleVakti;
  String cityName;
  String currentPrayerTime;

  Section2({super.key, 
    this.israk = 'xx',
    this.israkVakti = 'xx',
    this.dahve = 'xx',
    this.dahveVakti = 'xx',
    this.kerahet = 'xx',
    this.kerahetVakti = 'xx',
    this.gunes = 'xx',
    this.gunesVakti = 'xx',
    this.imsak = 'xx',
    this.imsakVakti = 'xx',
    this.sabah = 'xx',
    this.sabahVakti = 'xx',
    this.ogle = 'xx',
    this.ogleVakti = 'xx',
    this.ikindi = 'xx',
    this.ikindiVakti = 'xx',
    this.asrisani = 'xx',
    this.asrisaniVakti = 'xx',
    this.isfirar = 'xx',
    this.isfirarVakti = 'xx',
    this.aksam = 'xx',
    this.aksamVakti = 'xx',
    this.istibak = 'xx',
    this.istibakVakti = 'xx',
    this.yatsi = 'xx',
    this.yatsiVakti = 'xx',
    this.isaisani = 'xx',
    this.isaisaniVakti = 'xx',
    this.geceyarisi = 'xx',
    this.geceyarisiVakti = 'xx',
    this.teheccud = 'xx',
    this.teheccudVakti = 'xx',
    this.seher = 'xx',
    this.seherVakti = 'xx',
    this.kible = 'xx',
    this.kibleVakti = 'xx',
    this.cityName = 'xx',
    required this.currentPrayerTime,
  });

  @override
  State<Section2> createState() => _Section2State();
}

class _Section2State extends State<Section2> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            PrayerInfoSection(
              prayerTime: widget.imsakVakti,
              prayerTimeName: widget.imsak,
              isTheCurrent: widget.currentPrayerTime == widget.imsak,
            ),
            const MyDivider(),
            PrayerInfoSection(
              prayerTime: widget.sabahVakti,
              prayerTimeName: widget.sabah,
              isTheCurrent: widget.currentPrayerTime == widget.sabah,
            ),
            const MyDivider(),
            PrayerInfoSection(
                prayerTime: widget.gunesVakti,
                prayerTimeName: widget.gunes,
                isTheCurrent: widget.currentPrayerTime == widget.gunes),
            const MyDivider(),
            PrayerInfoSection(
                prayerTime: widget.israkVakti,
                prayerTimeName: widget.israk,
                isTheCurrent: widget.currentPrayerTime == widget.israk),
            const MyDivider(),
            PrayerInfoSection(
              prayerTime: widget.ogleVakti,
              prayerTimeName: widget.ogle,
              isTheCurrent: widget.currentPrayerTime == widget.ogle,
            ),
            const MyDivider(),
            PrayerInfoSection(
              prayerTime: widget.ikindiVakti,
              prayerTimeName: widget.ikindi,
              isTheCurrent: widget.currentPrayerTime == widget.ikindi,
            ),
            const MyDivider(),
            PrayerInfoSection(
              prayerTime: widget.aksamVakti,
              prayerTimeName: widget.aksam,
              isTheCurrent: widget.currentPrayerTime == widget.aksam,
            ),
            const MyDivider(),
            PrayerInfoSection(
              prayerTime: widget.yatsiVakti,
              prayerTimeName: widget.yatsi,
              isTheCurrent: widget.currentPrayerTime == widget.yatsi,
            ),

            /*
            const MyDivider(),
            PrayerInfoSection(
              prayerTime: widget.kibleVakti,
              prayerTimeName: widget.kible,
              isTheCurrent: false,
            ),
            */
          ],
        ),
      ],
    );
  }
}
