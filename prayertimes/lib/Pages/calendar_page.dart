import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:prayertimes/Services/calendar_service.dart';
import 'package:prayertimes/models/calendarmodel.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/parser.dart' as htmlParser;

import 'package:share_plus/share_plus.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key, required this.colors});
  final Color? colors;

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
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

  @override
  Widget build(BuildContext context) {
    gelenVeriler();

    return Scaffold(
        appBar: _appbar(widget.colors),
        body: takvimModel == null
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.pinkAccent,
              ))
            : Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 20.r, right: 20.r, top: 8.r),
                      child: SizedBox(
                        height: 600.r,
                        child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: HtmlWidget(
                              '''
                        <h2>$baslik</h2><h2>$yazi</h2><h2>$isimYemek</h2>
                       
                        ''',
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () async {
                              await _showmyDialog();
                            },
                            icon: Icon(
                              size: 40.r,
                              Icons.article_rounded,
                              color: Colors.pinkAccent,
                            )),
                        SizedBox(
                          width: 10.r,
                        ),
                        IconButton(
                            onPressed: () {
                              _showDatePicker();
                            },
                            icon: Icon(
                              Icons.date_range,
                              size: 40.r,
                              color: Colors.pinkAccent,
                            )),
                        SizedBox(
                          width: 10.r,
                        ),
                        IconButton(
                            onPressed: () {
                              shareHtml(context);
                            },
                            icon: Icon(
                              size: 40.r,
                              Icons.share,
                              color: Colors.pinkAccent,
                            ))
                      ],
                    ),
                  ),
                ],
              ));
  }

  AppBar _appbar(Color? color) {
    final DateFormat yabanciFormat = DateFormat('yyyy-MM-dd');
    Calendarservice c3 = Calendarservice();
    final DateTime yabanciDateTime = yabanciFormat.parse(c3.formatedDate);

    final DateFormat displayFormat = DateFormat('dd-MM-yyyy');
    final String formattedDate = displayFormat.format(yabanciDateTime);

    return AppBar(
      backgroundColor: color,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            formattedDate,
            style: TextStyle(
                fontSize: 22.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
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

  _showmyDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.pinkAccent,
          title: Text(
            "Diğer bilgiler",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                HtmlWidget(
                  '''
          <h3 style="color: white;">$gununOlayi</h3>
        ''',
                ),
                const SizedBox(
                  height: 15.0,
                ),
                HtmlWidget(
                  '''
          <h3 style="color: white;">$gununSozu</h3>
        ''',
                ),
                SizedBox(
                  height: 15.r,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                "Geri",
                style: TextStyle(fontSize: 14.sp, color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  void shareHtml(BuildContext context) {
    String htmlContent = """
  <span style="font-size: 19.2px; color: black;">$baslik $yazi $isimYemek</span>
""";
    final RenderBox box = context.findRenderObject() as RenderBox;

    // HTML içeriğini düz metin biçimine dönüştürme
    String plainTextContent =
        htmlParser.parse(htmlContent).documentElement!.text;

    Share.share(plainTextContent,
        subject: 'Yaprak Paylaşımı',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  _showDatePicker() async {
    DateTime? dateTime = await showOmniDateTimePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000, 1, 1), // İlk tarih 1 Ocak 2000
      lastDate: DateTime(DateTime.now().year, 12, 31), // Son tarih bugün
      is24HourMode: false,
      isShowSeconds: false,
      type: OmniDateTimePickerType.date, // Sadece tarih seçimi
      minutesInterval: 1,
      secondsInterval: 1,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 650,
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(
            Tween(
              begin: 0,
              end: 1,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      theme: ThemeData(
        primaryColor: Colors.white, // Ana renk
        hintColor: Colors.red, // Vurgu rengi
        colorScheme: const ColorScheme.light(
          primary: Colors.black, // Seçili tarih ve saat için ana renk
          onPrimary: Colors.white, // Seçili tarih ve saat üzerindeki yazı rengi
          surface: Colors.pinkAccent, // Arka plan rengi
          onSurface: Colors.white, // Yazı rengi
        ),
        dialogBackgroundColor:
            Colors.white, // Diyalog kutusunun arka plan rengi
      ),
      selectableDayPredicate: (dateTime) {
        // 25 Şubat 2023 tarihini devre dışı bırak
        if (dateTime == DateTime(1, 2, 25)) {
          return false;
        } else {
          return true;
        }
      },
    );

    if (dateTime != null) {
      setState(() {
        d1 = dateTime;
        print(Calendarservice().formatedDate);
        gelenVeriler();
      });
    }
  }
}
