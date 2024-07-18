import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:turkiyetakvimi/model/yaprakModel.dart';

import '../model/model.dart';

class Diger extends StatefulWidget {
  const Diger(
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

class _HomeScreenState extends State<Diger> {
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
                image: AssetImage(imageAsset), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    "DİĞER VAKİTLER",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width / 12,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 33,
                  ),
                  AutoSizeText(
                    "Dahve : ${widget.prayerTimeModel.dahve}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width / 16,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 200,
                  ),
                  AutoSizeText(
                    "Kerahet : ${widget.prayerTimeModel.kerahet}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width / 16,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 200,
                  ),
                  AutoSizeText(
                    "Asr-ı Sani : ${widget.prayerTimeModel.asrisani}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width / 16,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 200,
                  ),
                  AutoSizeText(
                    "İsfirar : ${widget.prayerTimeModel.isfirar}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width / 16,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 200,
                  ),
                  AutoSizeText(
                    "İstibak : ${widget.prayerTimeModel.istibak}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width / 16,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 200,
                  ),
                  AutoSizeText(
                    "İşa-i Sani : ${widget.prayerTimeModel.isaisani}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width / 16,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 200,
                  ),
                  AutoSizeText(
                    "Gece Yarısı : ${widget.prayerTimeModel.geceyarisi}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width / 16,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 200,
                  ),
                  AutoSizeText(
                    "Teheccüd : ${widget.prayerTimeModel.teheccud}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width / 16,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 200,
                  ),
                  AutoSizeText(
                    "Seher : ${widget.prayerTimeModel.seher}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width / 16,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 200,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "⫷",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.deepOrange[500],
                              fontWeight: FontWeight.normal,
                              fontSize: MediaQuery.of(context).size.width / 10),
                          minFontSize: 1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
