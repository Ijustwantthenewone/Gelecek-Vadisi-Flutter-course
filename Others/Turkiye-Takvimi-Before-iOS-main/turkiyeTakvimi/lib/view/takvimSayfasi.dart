import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:html/dom.dart' as dom;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share_plus/share_plus.dart';
import 'package:turkiyetakvimi/model/yaprakModel.dart';
import 'package:html/parser.dart' as htmlParser;

class TakvimSayfasi extends StatefulWidget {
  const TakvimSayfasi({super.key, required this.yaprak});
  final Yaprak yaprak;

  @override
  State<TakvimSayfasi> createState() => _TakvimSayfasiState();
}

class _TakvimSayfasiState extends State<TakvimSayfasi> {
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
        return "Ocak";
      case 2:
        return "Şubat";
      case 3:
        return "Mart";
      case 4:
        return "Nisan";
      case 5:
        return "Mayıs";
      case 6:
        return "Haziran";
      case 7:
        return "Temmuz";
      case 8:
        return "Ağustos";
      case 9:
        return "Eylül";
      case 10:
        return "Ekim";
      case 11:
        return "Kasım";
      case 12:
        return "Aralık";
      default:
        return "";
    }
  }

  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd MMMM yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    String htmlContent = """
  <span style="font-size: 19.2px; color: black;">
    ${widget.yaprak.arkayuz!.baslik}${widget.yaprak.arkayuz!.yazi}${widget.yaprak.isimYemek}
  </span>
""";

    void shareHtml(BuildContext context) {
      final RenderBox box = context.findRenderObject() as RenderBox;

      // HTML içeriğini düz metin biçimine dönüştürme
      String plainTextContent =
          htmlParser.parse(htmlContent).documentElement!.text;

      Share.share(plainTextContent,
          subject: 'Yaprak Paylaşımı',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }

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
      child: Scaffold(
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height / 9,
          color: Colors.transparent,
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "⫷   Ön sayfa",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.deepOrange[500],
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                      minFontSize: 1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black, // Divider'ın rengini ayarlayabilirsiniz
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
            "★★ ${DateTime.now().day} "
            "${getMonthName(DateTime.now().month)} ${DateTime.now().year} ★★",
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
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(35))),
          centerTitle: true,
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Html(
                        data: ("""
                  <span style="font-size: 19.2px; color: black;">
                    ${widget.yaprak.arkayuz!.baslik}${widget.yaprak.arkayuz!.yazi}${widget.yaprak.isimYemek}
                  </span>
                """),
                        style: {
                          "body": Style(color: Colors.black),
                        },
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  shareHtml(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                ),
                child: Icon(
                  Icons.share,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*



 */
