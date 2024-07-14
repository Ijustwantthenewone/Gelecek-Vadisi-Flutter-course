import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:prayertimes/Services/calendar_service.dart';
import 'package:prayertimes/Services/id.dart';
import 'package:prayertimes/Services/prayer_service.dart';
import 'package:prayertimes/models/calendarmodel.dart';
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
  //extra
  String? dahve;
  String? kerahet;
  String? asrisani;
  String? isfirar;
  String? istibak;
  String? isaisani;
  String? geceyarisi;
  String? teheccud;
  String? seher;
  String? kible;
  //extra

  //takvimsözleri

  Veri? takvimModel;
  String? yazi;
  String? baslik;
  String? miladiTarih;
  String? hicriTarih;
  int? hicriSemsi;
  String? rumi;
  String? hizirKasim;
  String? gunDurumu;
  String? ezaniDurum;
  String? gununSozu;
  String? gununOlayi;
  String? isimYemek;

  //takvimsözleri

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
  Map<String, String> ekstraVakitler = {};

  @override
  Widget build(BuildContext context) {
    gelenVeriler();
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
                            ],
                          ),
                        ),
                        if (_getNextPrayerTime() != null)
                          Padding(
                            padding: EdgeInsets.only(top: 20.r),
                            child: Text(
                              _getNextPrayerTime()!,
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                            IconButton(
                              iconSize: 45.r,
                              onPressed: () async {
                                await _showmyDialog();
                              },
                              icon: const Icon(
                                Icons.view_timeline_sharp,
                                color: Colors.teal,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 290.r,
                          height: 133.r,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.teal[100]!, width: 7.r),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                HtmlWidget(
                                  '''
    <h3 style="text-align: center; color: black;">$gununSozu</h3>

        ''',
                                ),
                                SizedBox(
                                  height: 15.r,
                                ),
                                HtmlWidget(
                                  '''
    <h3 style="text-align: center; color: black;">$gununOlayi</h3>

        ''',
                                ),
                                SizedBox(
                                  height: 15.r,
                                ),
                                HtmlWidget(
                                  '''
    <h3 style="text-align: center; color: black;">$ezaniDurum</h3>

        ''',
                                ),
                                SizedBox(
                                  height: 15.r,
                                ),
                                HtmlWidget(
                                  '''
    <h3 style="text-align: center; color: black;">$gunDurumu</h3>

        ''',
                                ),
                                SizedBox(
                                  height: 15.r,
                                ),
                                HtmlWidget(
                                  '''
    <h3 style="text-align: center; color: black;">$hizirKasim</h3>

        ''',
                                ),
                                SizedBox(
                                  height: 15.r,
                                ),
                                HtmlWidget(
                                  '''
    <h3 style="text-align: center; color: black;">Rumi $rumi</h3>

        ''',
                                ),
                                SizedBox(
                                  height: 15.r,
                                ),
                                HtmlWidget(
                                  '''
    <h3 style="text-align: center; color: black;">Hicrî Şemsî $hicriSemsi</h3>

        ''',
                                ),
                                SizedBox(
                                  height: 15.r,
                                ),
                                HtmlWidget(
                                  '''
    <h3 style="text-align: center; color: black;">Hicrî Tarih $hicriTarih</h3>

        ''',
                                ),
                                SizedBox(
                                  height: 15.r,
                                ),
                                HtmlWidget(
                                  '''
    <h3 style="text-align: center; color: black;">Miladi Tarih $miladiTarih</h3>

        ''',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }

  _showmyDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.tealAccent,
          title: Text(
            "Diğer vakitler",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                ...ekstraVakitler.entries.map(
                  (e) {
                    return SizedBox(
                      width: 250.r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.key,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            e.value,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                "Geri",
                style: TextStyle(fontSize: 20.sp, color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
        //extra
        dahve = prayerTime.dahve;
        kerahet = prayerTime.kerahet;
        asrisani = prayerTime.asrisani;
        isfirar = prayerTime.isfirar;
        istibak = prayerTime.istibak;
        isaisani = prayerTime.isaisani;
        geceyarisi = prayerTime.geceyarisi;
        teheccud = prayerTime.teheccud;
        seher = prayerTime.seher;
        kible = prayerTime.kible;
        //extra

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

      ekstraVakitler = {
        "Dahve": dahve ?? 'Loading...',
        "Kerahet": kerahet ?? 'Loading...',
        "Asrisani": asrisani ?? 'Loading...',
        "İsfirar": isfirar ?? 'Loading...',
        "İstibak": istibak ?? 'Loading...',
        "İsaisani": isaisani ?? 'Loading...',
        "Geceyarisi": geceyarisi ?? 'Loading...',
        "Teheccud": teheccud ?? 'Loading...',
        "Seher": seher ?? 'Loading...',
        "Kıble": kible ?? 'Loading...',
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

    int hours = difference.inHours;
    int minutes = difference.inMinutes.remainder(60);

    String hoursText = hours > 0 ? '$hours saat ' : '';
    String minutesText = minutes > 0 ? '$minutes dakika' : '';

    return hoursText + minutesText;
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
            '$prayer vaktine kalan ➜ ${_calculateRemainingTime(currentTime, prayerTime)}';
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
              '$prayer vaktine kalan ➜ ${_calculateRemainingTime(currentTime, prayerTime)}';
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

  gelenVeriler() async {
    Calendarservice c1 = Calendarservice();
    takvimModel = await c1.cek();
    yazi = takvimModel!.arkayuz!.yazi;
    baslik = takvimModel!.arkayuz!.baslik;
    miladiTarih = takvimModel!.miladiTarih;
    hicriTarih = takvimModel!.hicriTarih;
    hicriSemsi = takvimModel!.hicriSemsi;
    rumi = takvimModel!.rumi;
    hizirKasim = takvimModel!.hizirKasim;
    gunDurumu = takvimModel!.gunDurumu;
    ezaniDurum = takvimModel!.ezaniDurum;
    gununSozu = takvimModel!.gununSozu;
    gununOlayi = takvimModel!.gununOlayi;
    isimYemek = takvimModel!.isimYemek;

    if (mounted) {
      setState(() {});
    }
  }
}
