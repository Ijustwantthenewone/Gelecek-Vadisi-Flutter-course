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
  IdService s1 = IdService();
  Attributes? attributes;
  String? imsak;
  String? sabah;
  String? gunes;
  String? israk;
  String? ogle;
  String? ikindi;
  String? aksam;
  String? yatsi;
  String? appBarSehir = "İstanbul";

  bool _isLoading = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _checkSharedPreferences();
    _startTimer();
  }

  void _checkSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      appBarSehir = prefs.getString('sehir') ?? 'İstanbul';
    });
    if (prefs.getInt('saga') == null) {
      _getir(16741);
    } else {
      int? newId = prefs.getInt('saga');
      _getir(newId);
    }
  }

  Map<String, String> vakitler = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(widget.color),
      body: Center(
        child: SingleChildScrollView(
          child: _isLoading
              ? Column(
                  children: [
                    const CircularProgressIndicator(
                      color: Colors.teal,
                    ),
                    SizedBox(height: 30.r),
                    Text(
                      'Konum yükleniyor..',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              : imsak == null
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
                                        color: _isCurrentTime11(e.key) != null
                                            ? Colors.yellowAccent
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
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
                              if (_getNextPrayerTime() != null)
                                Padding(
                                  padding: EdgeInsets.only(top: 20.r),
                                  child: Text(
                                    _getNextPrayerTime()!,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        IconButton(
                          iconSize: 45.r,
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            int? newId = await s1.getId();
                            if (newId != null) {
                              await _getir(newId);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                      'Konum izni verilmedi, uygulamanın ayarlarından konum izni vermelisiniz.'),
                                ),
                              );
                            }
                            setState(() {
                              _isLoading = false;
                            });
                          },
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
      title: Center(
        child: Text(
          appBarSehir!,
          style: TextStyle(
              fontSize: 22.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Future<void> _getir(int? id) async {
    PrayerService prayerService = PrayerService();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    String desiredDate = formattedDate;

    List<Vakit> prayerTimes =
        await prayerService.cek(id.toString(), desiredDate);

    String? sehir = prefs.getString("sehir");

    setState(() {
      appBarSehir = sehir ?? "İstanbul";

      for (Vakit prayerTime in prayerTimes) {
        attributes = prayerTime.attributes;
        imsak = prayerTime.imsak;
        sabah = prayerTime.sabah;
        gunes = prayerTime.gunes;
        israk = prayerTime.israk;
        ogle = prayerTime.ogle;
        ikindi = prayerTime.ikindi;
        aksam = prayerTime.aksam;
        yatsi = prayerTime.yatsi;
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
    });
  }

  String? _isCurrentTime(String prayer) {
    final now = DateTime.now();
    final currentTime = DateFormat('HH:mm').format(now);
    String? result;

    switch (prayer) {
      case 'İmsak':
        if (_checkTimeBetween(currentTime, imsak!, sabah!)) {
          result = _calculateRemainingTime(currentTime, sabah!);
        }
        break;
      case 'Sabah':
        if (_checkTimeBetween(currentTime, sabah!, gunes!)) {
          result = _calculateRemainingTime(currentTime, gunes!);
        }
        break;
      case 'Güneş':
        if (_checkTimeBetween(currentTime, gunes!, israk!)) {
          result = _calculateRemainingTime(currentTime, israk!);
        }
        break;
      case 'İşrak':
        if (_checkTimeBetween(currentTime, israk!, ogle!)) {
          result = _calculateRemainingTime(currentTime, ogle!);
        }
        break;
      case 'Öğle':
        if (_checkTimeBetween(currentTime, ogle!, ikindi!)) {
          result = _calculateRemainingTime(currentTime, ikindi!);
        }
        break;
      case 'İkindi':
        if (_checkTimeBetween(currentTime, ikindi!, aksam!)) {
          result = _calculateRemainingTime(currentTime, aksam!);
        }
        break;
      case 'Akşam':
        if (_checkTimeBetween(currentTime, aksam!, yatsi!)) {
          result = _calculateRemainingTime(currentTime, yatsi!);
        }
        break;
      case 'Yatsı':
        if (_checkTimeBetween(currentTime, yatsi!, '23:59') ||
            _checkTimeBetween(currentTime, '00:00', imsak!)) {
          result = _calculateRemainingTime(currentTime, imsak!);
        }
        break;
    }

    if (result == null) {
      // Eğer şu anki zaman bu vaktin dışındaysa, bir sonraki vakti bulalım
      List<String> prayerKeys = vakitler.keys.toList();
      int currentIndex = prayerKeys.indexOf(prayer);
      for (int i = currentIndex + 1; i < prayerKeys.length; i++) {
        if (_checkTimeBetween(currentTime, vakitler[prayerKeys[i]]!,
            vakitler[prayerKeys[(i + 1) % prayerKeys.length]]!)) {
          result =
              _calculateRemainingTime(currentTime, vakitler[prayerKeys[i]]!);
          break;
        }
      }
    }

    return result;
  }

  bool _checkTimeBetween(String currentTime, String start, String end) {
    final format = DateFormat('HH:mm');
    final nowTime = format.parse(currentTime);
    final startTime = format.parse(start);
    final endTime = format.parse(end);

    if (startTime.isBefore(endTime)) {
      return nowTime.isAtSameMomentAs(startTime) ||
          (nowTime.isAfter(startTime) && nowTime.isBefore(endTime));
    } else {
      return nowTime.isAtSameMomentAs(startTime) ||
          nowTime.isAfter(startTime) ||
          nowTime.isBefore(endTime);
    }
  }

  String _calculateRemainingTime(String currentTime, String endTime) {
    final format = DateFormat('HH:mm');
    final now = format.parse(currentTime);
    final endDateTime = format.parse(endTime);
    final endDateTimeToday = DateTime(
        now.year, now.month, now.day, endDateTime.hour, endDateTime.minute);

    Duration difference;

    if (endDateTimeToday.isBefore(now)) {
      difference =
          endDateTimeToday.add(const Duration(days: 1)).difference(now);
    } else {
      difference = endDateTimeToday.difference(now);
    }

    return '${difference.inHours} saat ${difference.inMinutes.remainder(60)} dakika';
  }

  String? _getNextPrayerTime() {
    final now = DateTime.now();
    final currentTime = DateFormat('HH:mm').format(now);

    List<String> prayerKeys = vakitler.keys.toList();
    prayerKeys.sort((a, b) => DateFormat('HH:mm')
        .parse(vakitler[a]!)
        .compareTo(DateFormat('HH:mm').parse(vakitler[b]!)));

    String? nextPrayerTime;

    for (String prayer in prayerKeys) {
      String prayerTime = vakitler[prayer]!;

      if (DateFormat('HH:mm').parse(prayerTime).isAfter(now)) {
        nextPrayerTime =
            '$prayer vaktine kalan: ${_calculateRemainingTime(currentTime, prayerTime)}';
        break;
      }
    }

    if (nextPrayerTime == null) {
      // Eğer hiçbir gelecek namaz vakti bulunmazsa, bu günün son namaz vakti geçmiş demektir
      for (String prayer in prayerKeys) {
        String prayerTime = vakitler[prayer]!;

        if (_checkTimeBetween(currentTime, '00:00', prayerTime) ||
            _checkTimeBetween(
                currentTime, vakitler[prayerKeys.last]!, '23:59')) {
          nextPrayerTime =
              '$prayer vaktine kalan: ${_calculateRemainingTime(currentTime, prayerTime)}';
          break;
        }
      }
    }

    return nextPrayerTime;
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

  String? _isCurrentTime11(String prayer) {
    final now = DateTime.now();
    final currentTime = DateFormat('HH:mm').format(now);
    String? result;

    switch (prayer) {
      case 'İmsak':
        if (_checkTimeBetween(currentTime, imsak!, sabah!)) {
          result = _calculateRemainingTime(currentTime, sabah!);
        }
        break;
      case 'Sabah':
        if (_checkTimeBetween(currentTime, sabah!, gunes!)) {
          result = _calculateRemainingTime(currentTime, gunes!);
        }
        break;
      case 'Güneş':
        if (_checkTimeBetween(currentTime, gunes!, israk!)) {
          result = _calculateRemainingTime(currentTime, israk!);
        }
        break;
      case 'İşrak':
        if (_checkTimeBetween(currentTime, israk!, ogle!)) {
          result = _calculateRemainingTime(currentTime, ogle!);
        }
        break;
      case 'Öğle':
        if (_checkTimeBetween(currentTime, ogle!, ikindi!)) {
          result = _calculateRemainingTime(currentTime, ikindi!);
        }
        break;
      case 'İkindi':
        if (_checkTimeBetween(currentTime, ikindi!, aksam!)) {
          result = _calculateRemainingTime(currentTime, aksam!);
        }
        break;
      case 'Akşam':
        if (_checkTimeBetween(currentTime, aksam!, yatsi!)) {
          result = _calculateRemainingTime(currentTime, yatsi!);
        }
        break;
      case 'Yatsı':
        if (_checkTimeBetween(currentTime, yatsi!, '23:59') ||
            _checkTimeBetween(currentTime, '00:00', imsak!)) {
          result = _calculateRemainingTime(currentTime, imsak!);
        }
        break;
    }

    return result;
  }
}
