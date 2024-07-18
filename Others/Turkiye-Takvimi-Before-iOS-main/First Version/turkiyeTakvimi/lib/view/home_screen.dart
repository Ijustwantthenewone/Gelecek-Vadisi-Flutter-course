import 'dart:async';

import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:turkiyetakvimi/model/yaprakModel.dart';
import 'package:turkiyetakvimi/view/takvimSayfasi.dart';

import '../components/section1.dart';
import '../components/section2.dart';
import '../model/model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.prayerTimeModel, required this.cityName, required this.arkayuzModel});

  final Vakit prayerTimeModel;
  final String cityName;
  final Yaprak arkayuzModel;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentPrayerTime = '';
  String nextPrayerTime = '';
  Timer? timer;

  String findTargetPrayerTime() {
    String currentTime = uptadeCurrentTime();

    if (currentTime == widget.prayerTimeModel.sabah) {
      nextPrayerTime = 'Öğle Vakti';
      return widget.prayerTimeModel.ogle!;
    } else if (currentTime == widget.prayerTimeModel.ogle) {
      nextPrayerTime = 'İkindi Vakti';
      return widget.prayerTimeModel.ikindi!;
    } else if (currentTime == widget.prayerTimeModel.ikindi) {
      nextPrayerTime = 'Akşam Vakti';
      return widget.prayerTimeModel.aksam!;
    } else if (currentTime == widget.prayerTimeModel.aksam) {
      nextPrayerTime = 'Yatsı Vakti';
      return widget.prayerTimeModel.yatsi!;
    } else {
      nextPrayerTime = 'Sabah Vakti';
      return widget.prayerTimeModel.sabah!;
    }
  }

  String uptadeCurrentTime() {
    String a = '';
    if (DateTime.now().minute < 10) {
      a = '0';
    }
    int currentHour =
        int.parse("${DateTime.now().hour}$a${DateTime.now().minute}");

    if (currentHour >=
            int.parse(widget.prayerTimeModel.sabah!.replaceRange(2, 3, '')) &&
        currentHour <=
            int.parse(widget.prayerTimeModel.ogle!.replaceRange(2, 3, ''))) {
      return currentPrayerTime = widget.prayerTimeModel.sabah!;
    } else if (currentHour >=
            int.parse(widget.prayerTimeModel.ogle!.replaceRange(2, 3, '')) &&
        currentHour <=
            int.parse(widget.prayerTimeModel.ikindi!.replaceRange(2, 3, ''))) {
      return currentPrayerTime = widget.prayerTimeModel.ogle!;
    } else if (currentHour >=
            int.parse(widget.prayerTimeModel.ikindi!.replaceRange(2, 3, '')) &&
        currentHour <=
            int.parse(widget.prayerTimeModel.aksam!.replaceRange(2, 3, ''))) {
      return currentPrayerTime = widget.prayerTimeModel.ikindi!;
    } else if (currentHour >=
            int.parse(widget.prayerTimeModel.aksam!.replaceRange(2, 3, '')) &&
        currentHour <=
            int.parse(widget.prayerTimeModel.yatsi!.replaceRange(2, 3, ''))) {
      return currentPrayerTime = widget.prayerTimeModel.aksam!;
    } else {
      return currentPrayerTime = widget.prayerTimeModel.yatsi!;
    }
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentPrayerTime = uptadeCurrentTime();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageFlipBuilder(
        frontBuilder: (_) => Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: currentPrayerTime ==
                                  widget.prayerTimeModel.aksam ||
                              currentPrayerTime == widget.prayerTimeModel.yatsi
                          ? const AssetImage('assets/img.png')
                          : const AssetImage('assets/img_1.png'),
                      fit: BoxFit.cover)),
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: MediaQuery.of(context).size.height / 30,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  title: Text("TÜRKİYE TAKVİMİ",
                      style: TextStyle(
                          color: Colors.red[900], fontStyle: FontStyle.italic)),
                  centerTitle: true,
                ),
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width / 2.7,
                            child: AnalogClock(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.6, color: Colors.white),
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                width: 200.0,
                                height: 250.0,
                                hourHandColor: Colors.red,
                                minuteHandColor: Colors.black,
                                showSecondHand: false,
                                numberColor: Colors.black87,
                                showNumbers: true,
                                showAllNumbers: false,
                                textScaleFactor: 1.4,
                                showTicks: true,
                                showDigitalClock: false,
                                isLive: false,
                                datetime: DateTime.parse(
                                    '2020-01-02 ${widget.prayerTimeModel.gunes}:00')),
                          ),
                        ],
                      ),
                      Section1(
                        nextPrayerTime: findTargetPrayerTime(),
                        vakit: nextPrayerTime,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      Section2(
                        israk: widget.prayerTimeModel.israk!,
                        israkVakti: 'İşrak',
                        imsak: widget.prayerTimeModel.imsak!,
                        imsakVakti: "İmsak",
                        sabah: widget.prayerTimeModel.sabah!,
                        sabahVakti: "Sabah",
                        gunes: widget.prayerTimeModel.gunes!,
                        gunesVakti: "Güneş",
                        ogle: widget.prayerTimeModel.ogle!,
                        ogleVakti: "Öğle",
                        ikindi: widget.prayerTimeModel.ikindi!,
                        ikindiVakti: "İkindi",
                        aksam: widget.prayerTimeModel.aksam!,
                        aksamVakti: "Akşam",
                        yatsi: widget.prayerTimeModel.yatsi!,
                        yatsiVakti: "Yatsı",
                        cityName: widget.cityName,
                        currentPrayerTime: currentPrayerTime,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        backBuilder: (_) =>  TakvimSayfasi(yaprak: widget.arkayuzModel,));
  }
}
