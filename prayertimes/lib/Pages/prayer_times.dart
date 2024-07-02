import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:prayertimes/Services/id.dart';
import 'package:prayertimes/Services/prayer_service.dart';
import 'package:prayertimes/models/prayermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Prayertimes extends StatefulWidget {
  Prayertimes({super.key, required this.color});
  Color? color;

  @override
  State<Prayertimes> createState() => _PrayertimesState();
}

class _PrayertimesState extends State<Prayertimes> {
  Attributes? attributes;
  String? imsak;
  String? sabah;
  String? gunes;
  String? israk;
  String? dahve;
  String? kerahet;
  String? ogle;
  String? ikindi;
  String? asrisani;
  String? isfirar;
  String? aksam;
  String? istibak;
  String? yatsi;
  String? isaisani;
  String? geceyarisi;
  String? teheccud;
  String? seher;
  String? kible;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _checkSharedPreferences();
    _startTimer();
  }

  void _checkSharedPreferences() async {
    
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('saga') == null) {
      _getir(16741);
    }
  }

  Map<String, String> vakitler = {};
  Map<String, String> vakitlerextra = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(widget.color),
      body: Center(
        child: SingleChildScrollView(
          child: imsak == null
              ? const CircularProgressIndicator(
                  color: Colors.teal,
                )
              : Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.teal[100],
                      ),
                      child: Column(
                        children: [
                          ...vakitler.entries.map(
                            (e) {
                              return SizedBox(
                                width: 250.r,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _isCurrentTime(e.key)
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.all(8.r),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        e.key,
                                        style: TextStyle(
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        e.value,
                                        style: TextStyle(
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      iconSize: 45.r,
                      onPressed: () async {},
                      icon: const Icon(
                        Icons.location_on,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  AppBar _appbar(Color? color) {
    return AppBar(
      backgroundColor: color,
    );
  }

  Future<void> _getir(int? id) async {
    PrayerService prayerService = PrayerService();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    String desiredDate = formattedDate;

    List<Vakit> prayerTimes =
        await prayerService.cek(id.toString(), desiredDate);

    setState(() {
      for (Vakit prayerTime in prayerTimes) {
        attributes = prayerTime.attributes;
        imsak = prayerTime.imsak;
        sabah = prayerTime.sabah;
        gunes = prayerTime.gunes;
        israk = prayerTime.israk;
        dahve = prayerTime.dahve;
        kerahet = prayerTime.kerahet;
        ogle = prayerTime.ogle;
        ikindi = prayerTime.ikindi;
        asrisani = prayerTime.asrisani;
        isfirar = prayerTime.isfirar;
        aksam = prayerTime.aksam;
        istibak = prayerTime.istibak;
        yatsi = prayerTime.yatsi;
        isaisani = prayerTime.isaisani;
        geceyarisi = prayerTime.geceyarisi;
        teheccud = prayerTime.teheccud;
        seher = prayerTime.seher;
        kible = prayerTime.kible;
      }

      vakitler = {
        "İmsak": imsak ?? 'Loading...',
        "Sabah": sabah ?? 'Loading...',
        "Güneş": gunes ?? 'Loading...',
        "İşrak": israk ?? 'Loading...',
        "Öğle": ogle ?? 'Loading...',
        "İkindi": ikindi ?? 'Loading...',
        "Akşam": aksam ?? 'Loading...',
        "Yatsı": yatsi ?? 'Loading...',
      };

      vakitlerextra = {
        "Dahve": dahve ?? 'Loading...',
        "Kerahat": kerahet ?? 'Loading...',
        "Öğle": ogle ?? 'Loading...',
        "İkindi": ikindi ?? 'Loading...',
        "İsfirar": isfirar ?? 'Loading...',
        "İstibak": istibak ?? 'Loading...',
        "İşâ-i Sânî": isaisani ?? 'Loading...',
        "Gece yarısı": geceyarisi ?? 'Loading...',
        "Teheccüd": teheccud ?? 'Loading...',
        "Seher": seher ?? 'Loading...',
        "Kıble": kible ?? 'Loading...',
      };
    });
  }

  bool _isCurrentTime(String prayer) {
    final now = DateTime.now();
    final currentTime = DateFormat('HH:mm').format(now);

    switch (prayer) {
      case 'İmsak':
        return _checkTimeBetween(currentTime, imsak!, sabah!);
      case 'Sabah':
        return _checkTimeBetween(currentTime, sabah!, gunes!);
      case 'Güneş':
        return _checkTimeBetween(currentTime, gunes!, israk!);
      case 'İşrak':
        return _checkTimeBetween(currentTime, israk!, ogle!);
      case 'Öğle':
        return _checkTimeBetween(currentTime, ogle!, ikindi!);
      case 'İkindi':
        return _checkTimeBetween(currentTime, ikindi!, aksam!);
      case 'Akşam':
        return _checkTimeBetween(currentTime, aksam!, yatsi!);
      case 'Yatsı':
        return _checkTimeBetween(currentTime, yatsi!, '23:59') ||
            _checkTimeBetween(currentTime, '00:00', imsak!);
      default:
        return false;
    }
  }

  bool _checkTimeBetween(String currentTime, String start, String end) {
    final format = DateFormat('HH:mm');
    final nowTime = format.parse(currentTime);
    final startTime = format.parse(start);
    final endTime = format.parse(end);

    if (startTime.isBefore(endTime)) {
      return nowTime.isAtSameMomentAs(startTime) ||
          nowTime.isAfter(startTime) && nowTime.isBefore(endTime);
    } else {
      return nowTime.isAtSameMomentAs(startTime) ||
          nowTime.isAfter(startTime) ||
          nowTime.isBefore(endTime);
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}



/*
 int? id = await s1.getId();
                  await prefs.setInt('id', id!);

                  if (prefs.getInt('id') == null) {
      _getir("16741");
      await prefs.setInt('id', 16741);
      print(imsak);
    } else {
      print("asd");
    }
*/

/*
Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 0.0,
                                horizontal: 0.0), // Kart kenar boşlukları
                            color: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12.0),
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85, // Kartın genişliğini daralt
                                    child: ListTile(
                                        contentPadding: EdgeInsets
                                            .zero, // İç kenar boşluklarını sıfırla
                                        trailing: Text(
                                          e.value ?? "Bilinmiyor",
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        title: Text(
                                          e.key,
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        )))));
                      },
*/
