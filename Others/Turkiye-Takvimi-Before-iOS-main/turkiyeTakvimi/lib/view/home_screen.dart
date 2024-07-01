import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import 'package:turkiyetakvimi/model/yaprakModel.dart';
import 'package:turkiyetakvimi/view/Di%C4%9Fer%20vakitler.dart';

import 'package:turkiyetakvimi/view/loading_screen.dart';
import 'package:turkiyetakvimi/view/takvimSayfasi.dart';

import '../components/section1.dart';
import '../components/section2.dart';
import '../model/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key,
      required this.prayerTimeModel,
      required this.cityName,
      required this.arkayuzModel});

  final Vakit prayerTimeModel;
  final String cityName;
  final Yaprak arkayuzModel;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var sayfaYenileme = const Duration(minutes: 10);

  yenileme() {
    Future.delayed(
      sayfaYenileme,
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoadingScreen(),
            ));
      },
    );
  }

  String getWeekdayName(int weekday) {
    switch (weekday) {
      case 1:
        return "Pazartesi";
      case 2:
        return "Salı";
      case 3:
        return "Çarşamba";
      case 4:
        return "Perşembe";
      case 5:
        return "Cuma";
      case 6:
        return "Cumartesi";
      case 7:
        return "Pazar";
      default:
        return "";
    }
  }

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return "OCAK";
      case 2:
        return "ŞUBAT";
      case 3:
        return "MART";
      case 4:
        return "NİSAN";
      case 5:
        return "MAYIS";
      case 6:
        return "HAZİRAN";
      case 7:
        return "TEMMUZ";
      case 8:
        return "AĞUSTOS";
      case 9:
        return "EYLÜL";
      case 10:
        return "EKİM";
      case 11:
        return "KASIM";
      case 12:
        return "ARALIK";
      default:
        return "";
    }
  }

  String currentPrayerTime = '';
  String nextPrayerTime = '';
  Timer? timer;

  String findTargetPrayerTime() {
    String currentTime = uptadeCurrentTime();

    if (currentTime == widget.prayerTimeModel.yatsi) {
      nextPrayerTime = 'İmsak vakti';
      return widget.prayerTimeModel.imsak!;
    } else if (currentTime == widget.prayerTimeModel.imsak) {
      nextPrayerTime = 'Sabah vakti';
      return widget.prayerTimeModel.sabah!;
    } else if (currentTime == widget.prayerTimeModel.sabah) {
      nextPrayerTime = 'Güneş vakti';
      return widget.prayerTimeModel.gunes!;
    } else if (currentTime == widget.prayerTimeModel.gunes) {
      nextPrayerTime = 'İşrak vakti';
      return widget.prayerTimeModel.israk!;
    } else if (currentTime == widget.prayerTimeModel.israk) {
      nextPrayerTime = 'Öğle vakti';
      return widget.prayerTimeModel.ogle!;
    } else if (currentTime == widget.prayerTimeModel.ogle) {
      nextPrayerTime = 'İkindi vakti';
      return widget.prayerTimeModel.ikindi!;
    } else if (currentTime == widget.prayerTimeModel.ikindi) {
      nextPrayerTime = 'Akşam vakti';
      return widget.prayerTimeModel.aksam!;
    } else if (currentTime == widget.prayerTimeModel.aksam) {
      nextPrayerTime = 'Yatsı vakti';
      return widget.prayerTimeModel.yatsi!;
    } else {
      nextPrayerTime = 'İmsak vakti';
      return widget.prayerTimeModel.imsak!;
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
            int.parse(widget.prayerTimeModel.imsak!.replaceRange(2, 3, '')) &&
        currentHour <
            int.parse(widget.prayerTimeModel.sabah!.replaceRange(2, 3, ''))) {
      return widget.prayerTimeModel.imsak!;
    } else if (currentHour >=
            int.parse(widget.prayerTimeModel.sabah!.replaceRange(2, 3, '')) &&
        currentHour <
            int.parse(widget.prayerTimeModel.gunes!.replaceRange(2, 3, ''))) {
      return widget.prayerTimeModel.sabah!;
    } else if (currentHour >=
            int.parse(widget.prayerTimeModel.gunes!.replaceRange(2, 3, '')) &&
        currentHour <
            int.parse(widget.prayerTimeModel.israk!.replaceRange(2, 3, ''))) {
      return widget.prayerTimeModel.gunes!;
    } else if (currentHour >=
            int.parse(widget.prayerTimeModel.israk!.replaceRange(2, 3, '')) &&
        currentHour <
            int.parse(widget.prayerTimeModel.ogle!.replaceRange(2, 3, ''))) {
      return widget.prayerTimeModel.israk!;
    } else if (currentHour >=
            int.parse(widget.prayerTimeModel.ogle!.replaceRange(2, 3, '')) &&
        currentHour <
            int.parse(widget.prayerTimeModel.ikindi!.replaceRange(2, 3, ''))) {
      return widget.prayerTimeModel.ogle!;
    } else if (currentHour >=
            int.parse(widget.prayerTimeModel.ikindi!.replaceRange(2, 3, '')) &&
        currentHour <
            int.parse(widget.prayerTimeModel.aksam!.replaceRange(2, 3, ''))) {
      return widget.prayerTimeModel.ikindi!;
    } else if (currentHour >=
            int.parse(widget.prayerTimeModel.aksam!.replaceRange(2, 3, '')) &&
        currentHour <
            int.parse(widget.prayerTimeModel.yatsi!.replaceRange(2, 3, ''))) {
      return widget.prayerTimeModel.aksam!;
    } else {
      return widget.prayerTimeModel.yatsi!;
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    yenileme();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentPrayerTime = uptadeCurrentTime();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int hour = now.hour;
    String imageAsset;

    if (hour >= 18 || hour < 4) {
      imageAsset = 'assets/peakpx.jpg';
    } else {
      imageAsset = 'assets/img_12.png';
    }

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(imageAsset))),
        child: WillPopScope(
          onWillPop: () async {
            return false; // Geri tuşunu devre dışı bırakmak için
          },
          child: Scaffold(
            bottomNavigationBar: Container(
              height: MediaQuery.of(context).size.height / 9,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InteractiveViewer(
                                    panEnabled: false,
                                    // Set it to false to prevent panning.
                                    boundaryMargin: const EdgeInsets.all(80),
                                    minScale: 0.5,
                                    maxScale: 4,
                                    child: TakvimSayfasi(
                                        yaprak: widget.arkayuzModel),
                                  )));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AutoSizeText(
                          "Arka sayfa   ⫸",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.deepOrange[500],
                              fontWeight: FontWeight.normal,
                              fontSize: MediaQuery.of(context).size.width / 23),
                          minFontSize: 1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  /*
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InteractiveViewer(
                                panEnabled: false,
                                // Set it to false to prevent panning.
                                boundaryMargin: EdgeInsets.all(80),
                                minScale: 0.5,
                                maxScale: 4,
                                child:
                                    TakvimSayfasi(yaprak: widget.arkayuzModel),
                              )));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      "Arka sayfa   ⫸",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.deepOrange[500],
                          fontWeight: FontWeight.normal,
                          fontSize: MediaQuery.of(context).size.width / 15),
                      minFontSize: 1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              */
                  const Divider(
                    color:
                        Colors.black, // Divider'ın rengini ayarlayabilirsiniz
                    height: 1, // Divider'ın yüksekliğini ayarlayabilirsiniz
                    thickness: 0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: const AssetImage("assets/pngegg.png"),
                            width: MediaQuery.of(context).size.width / 4.0,
                            height: MediaQuery.of(context).size.height / 0.1,
                          ),
                          Image(
                            image: const AssetImage("assets/pngegg1.png"),
                            width: MediaQuery.of(context).size.width / 5.0,
                            height: MediaQuery.of(context).size.height / 0.3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height / 30,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              title: AutoSizeText(
                "★★ ${widget.cityName} ★★".toUpperCase(),
                // haftanın gününü alarak kullan
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width / 29),
                minFontSize: 1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(35))),
              centerTitle: true,
            ),
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.95,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  200,
                                            ),
                                            Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  Image(
                                                    image: const AssetImage(
                                                        "assets/ayak.png"),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3.5,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            13.5,
                                                  ),
                                                  Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              3.5,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              13.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                width: 1,
                                                                color: Colors
                                                                    .black),
                                                            // Add a border to create an empty frame
                                                            color: Colors
                                                                .white, // Set the color to transparent to make the container empty
                                                          ),
                                                        ),
                                                        Stack(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            children: [
                                                              const Image(
                                                                  image: AssetImage(
                                                                      "assets/evs.png"),
                                                                  width: 110,
                                                                  height: 40),
                                                              SizedBox(
                                                                width: 100,
                                                                height: 140,
                                                                child: Center(
                                                                  child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    children: [
                                                                      AnalogClock(
                                                                        dateTime:
                                                                            DateTime.parse('2020-01-02 ${widget.prayerTimeModel.gunes}:00'),
                                                                        isKeepTime:
                                                                            false,
                                                                        dialColor:
                                                                            Colors.white,
                                                                        dialBorderColor:
                                                                            Colors.black,
                                                                        dialBorderWidthFactor:
                                                                            0.02,
                                                                        markingColor:
                                                                            Colors.black,
                                                                        markingRadiusFactor:
                                                                            0.99,
                                                                        markingWidthFactor:
                                                                            1.0,
                                                                        hourNumberColor:
                                                                            Colors.black,
                                                                        hourNumbers: const [
                                                                          '1',
                                                                          '2',
                                                                          '3',
                                                                          '4',
                                                                          '5',
                                                                          '6',
                                                                          '7',
                                                                          '8',
                                                                          '9',
                                                                          '10',
                                                                          '11',
                                                                          '12'
                                                                        ],
                                                                        hourNumberSizeFactor:
                                                                            1.6,
                                                                        hourNumberRadiusFactor:
                                                                            0.9,
                                                                        hourHandColor:
                                                                            Colors.black,
                                                                        hourHandWidthFactor:
                                                                            0.95,
                                                                        hourHandLengthFactor:
                                                                            0.6,
                                                                        minuteHandColor:
                                                                            Colors.black,
                                                                        minuteHandWidthFactor:
                                                                            2.1,
                                                                        minuteHandLengthFactor:
                                                                            0.71,
                                                                        secondHandColor:
                                                                            Colors.red,
                                                                        secondHandWidthFactor:
                                                                            0,
                                                                        secondHandLengthFactor:
                                                                            0.0,
                                                                        centerPointColor:
                                                                            Colors.black,
                                                                        centerPointWidthFactor:
                                                                            1.0,
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                1,
                                                                        height:
                                                                            MediaQuery.of(context).size.height /
                                                                                2,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                          border: Border.all(
                                                                              width: 2,
                                                                              color: Colors.black),
                                                                          // Add a border to create an empty frame
                                                                          color:
                                                                              Colors.transparent, // Set the color to transparent to make the container empty
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            88,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                          border: Border.all(
                                                                              width: 2,
                                                                              color: Colors.black),
                                                                          // Add a border to create an empty frame
                                                                          color:
                                                                              Colors.transparent, // Set the color to transparent to make the container empty
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ]),
                                                      ]),
                                                ]),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  100,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Section2(
                                            imsak:
                                                widget.prayerTimeModel.imsak!,
                                            imsakVakti: "İmsak ",
                                            sabah:
                                                widget.prayerTimeModel.sabah!,
                                            sabahVakti: "Sabah ",
                                            gunes:
                                                widget.prayerTimeModel.gunes!,
                                            gunesVakti: "Güneş ",
                                            israk:
                                                widget.prayerTimeModel.israk!,
                                            israkVakti: "İşrak   ",
                                            ogle: widget.prayerTimeModel.ogle!,
                                            ogleVakti: "Öğle    ",
                                            ikindi:
                                                widget.prayerTimeModel.ikindi!,
                                            ikindiVakti: "İkindi  ",
                                            aksam:
                                                widget.prayerTimeModel.aksam!,
                                            aksamVakti: "Akşam",
                                            yatsi:
                                                widget.prayerTimeModel.yatsi!,
                                            yatsiVakti: "Yatsı   ",
                                            /*
                                            kible: widget.prayerTimeModel.kible!,
                                            kibleVakti: "Kıble",

                                             */
                                            cityName: widget.cityName,
                                            currentPrayerTime:
                                                currentPrayerTime,
                                          ),
                                        ],
                                      ),
                                    ]),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 110,
                            ),
                            AutoSizeText(
                              "${DateTime.now().day}",
                              // ${DateTime.now().year}
                              // bulunduğumuz yılı alarak kullan
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 10),
                              minFontSize: 1,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Center(
                              child: AutoSizeText(
                                getMonthName(DateTime.now().month),
                                // bulunduğumuz yılı alarak kullan
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 24),
                                minFontSize: 1,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Center(
                              child: AutoSizeText(
                                "${DateTime.now().year}".toUpperCase(),
                                // ${DateTime.now().year}
                                // bulunduğumuz yılı alarak kullan
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 25),
                                minFontSize: 1,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 100,
                            ),
                            Center(
                              child: AutoSizeText(
                                getWeekdayName(DateTime.now().weekday)
                                    .toUpperCase(),
                                // haftanın gününü alarak kullan
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 30),
                                minFontSize: 1,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 75,
                        ),
                        Column(
                          //seke
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 100,
                            ),
                            Stack(alignment: Alignment.bottomCenter, children: [
                              Image(
                                image: const AssetImage("assets/ayak.png"),
                                width: MediaQuery.of(context).size.width / 3.5,
                                height:
                                    MediaQuery.of(context).size.height / 13.5,
                              ),
                              Stack(alignment: Alignment.center, children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  height:
                                      MediaQuery.of(context).size.height / 13.5,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                    // Add a border to create an empty frame
                                    color: Colors
                                        .white, // Set the color to transparent to make the container empty
                                  ),
                                ),
                                Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      const Image(
                                          image: AssetImage("assets/evs.png"),
                                          width: 110,
                                          height: 40),
                                      SizedBox(
                                        width: 100,
                                        height: 140,
                                        child: Center(
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              AnalogClock(
                                                dateTime: DateTime.now(),
                                                isKeepTime: true,
                                                dialColor: Colors.white,
                                                dialBorderColor: Colors.black,
                                                dialBorderWidthFactor: 0.02,
                                                markingColor: Colors.black,
                                                markingRadiusFactor: 0.99,
                                                markingWidthFactor: 1.0,
                                                hourNumberColor: Colors.black,
                                                hourNumbers: const [
                                                  '1',
                                                  '2',
                                                  '3',
                                                  '4',
                                                  '5',
                                                  '6',
                                                  '7',
                                                  '8',
                                                  '9',
                                                  '10',
                                                  '11',
                                                  '12'
                                                ],
                                                hourNumberSizeFactor: 1.6,
                                                hourNumberRadiusFactor: 0.9,
                                                hourHandColor: Colors.black,
                                                hourHandWidthFactor: 0.95,
                                                hourHandLengthFactor: 0.6,
                                                minuteHandColor: Colors.black,
                                                minuteHandWidthFactor: 2.1,
                                                minuteHandLengthFactor: 0.71,
                                                secondHandColor: Colors.red,
                                                secondHandWidthFactor: 2,
                                                secondHandLengthFactor: 0.8,
                                                centerPointColor: Colors.black,
                                                centerPointWidthFactor: 1.0,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    2,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 2,
                                                      color: Colors.black),
                                                  // Add a border to create an empty frame
                                                  color: Colors
                                                      .transparent, // Set the color to transparent to make the container empty
                                                ),
                                              ),
                                              Container(
                                                width: 100,
                                                height: 88,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 2,
                                                      color: Colors.black),
                                                  // Add a border to create an empty frame
                                                  color: Colors
                                                      .transparent, // Set the color to transparent to make the container empty
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                              ]),
                            ]),
                            Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.3,
                                  height:
                                      MediaQuery.of(context).size.height / 17,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 01.5,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          "${widget.arkayuzModel.hicriTarih} ",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                33,
                                            color: Colors.black,
                                          ),
                                          minFontSize: 1,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 300,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.3,
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          "${widget.arkayuzModel.hizirKasim}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                28,
                                            color: Colors.black,
                                          ),
                                          minFontSize: 1,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 300,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.3,
                                  height:
                                      MediaQuery.of(context).size.height / 17,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          "Kıble : ${widget.prayerTimeModel.kible}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                28,
                                            color: Colors.black,
                                          ),
                                          minFontSize: 1,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 300,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.3,
                                  height:
                                      MediaQuery.of(context).size.height / 14.0,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Diger(
                                                    arkayuzModel:
                                                        widget.arkayuzModel,
                                                    prayerTimeModel:
                                                        widget.prayerTimeModel,
                                                    cityName: '',
                                                  ),
                                                ));
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.access_time_filled,

                                                color: Colors.black,
                                                // Bu, ikonun rengini pembe yapar.
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                                DigitalClock(
                                  hourMinuteDigitTextStyle: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                21,
                                        color: Colors.black,
                                      ),
                                  secondDigitTextStyle: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              21,
                                          color: Colors.black),
                                  colon: Text(
                                    ":",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                20,
                                            color: Colors.black),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 75,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Section1(
                              nextPrayerTime: findTargetPrayerTime(),
                              vakit: nextPrayerTime,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 0,
                          child: Divider(
                            color: Colors.black,
                            height: 10,
                            thickness: 1,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                AutoSizeText(
                                  "*",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 15,
                                    color: Colors.black,
                                  ),
                                  minFontSize: 1,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              height: MediaQuery.of(context).size.height / 9,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(23),
                              ),
                              child: SingleChildScrollView(
                                child: Html(
                                  data: """
      <span style="font-size: 18px; text-align: center; color: black;">
        <strong>${widget.arkayuzModel.gununSozu.toString()}</strong>
                                  </span>
                                """,
                                  style: {
                                    "body": Style(color: Colors.black),
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 0,
                          child: Divider(
                            color: Colors.black,
                            height: 10,
                            thickness: 1,
                          ),
                        ),
                        Center(
                          child: AutoSizeText(
                            "${widget.arkayuzModel.gunDurumu}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 23,
                              color: Colors.black,
                            ),
                            minFontSize: 1,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Center(
                          child: AutoSizeText(
                            "${widget.arkayuzModel.ezaniDurum}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 23,
                              color: Colors.black,
                            ),
                            minFontSize: 1,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
