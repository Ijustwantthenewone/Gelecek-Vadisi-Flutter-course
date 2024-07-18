import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as asd;

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final String _apiKey = "a7308abc59d3d9445b401b16c901a963";

  TextEditingController t1 = TextEditingController();

  final String _baseURL =
      "http://api.exchangeratesapi.io/v1/latest?access_key=";

  Map<String, double> oranlar = {};
  double sonuc = 0;
  String secilenKur = "USD";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      verileriInternettenCek();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 176, 0, 199),
        title: const Text(
          "Kur dönüştürücü",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 13, left: 18, right: 18),
        child: Column(children: [
          _buildExchangeRow(),
          SizedBox(
            height: 16,
          ),
          yazilar(),
          Container(
            color: Colors.black,
            height: 2,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: oranlar.isNotEmpty
                ? ListView.builder(
                    itemCount: oranlar.keys.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(oranlar.keys.toList()[index]),
                        trailing: Text(
                          "${oranlar.values.toList()[index].toStringAsFixed(1)} ₺",
                          style: TextStyle(fontSize: 17),
                        ),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator()),
          )
        ]),
      ),
    );
  }

  Widget _buildExchangeRow() {
    return Row(
      children: [
        Expanded(
            child: TextField(
          onChanged: (value) {
            if (value.isEmpty) {
              setState(() {
                sonuc = 0;
              });
            }
            hesapla();
          },
          controller: t1,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )),
        SizedBox(
          width: 5,
        ),
        DropdownButton(
            icon: oranlar.isNotEmpty
                ? Icon(Icons.arrow_downward)
                : Center(child: CircularProgressIndicator()),
            value: secilenKur,
            underline: SizedBox(),
            onChanged: (value) {
              if (value != null) {
                secilenKur = value;
                hesapla();
              }
            },
            items: oranlar.keys.map((e) {
              return DropdownMenuItem(
                child: Text(e),
                value: e,
                onTap: () {},
              );
            }).toList())
      ],
    );
  }

  void hesapla() {
    double? sayi = double.tryParse(t1.text);
    double? sayi2 = oranlar[secilenKur];

    if (sayi != null && sayi2 != null) {
      setState(() {
        sonuc = sayi * sayi2;
      });
    }
  }

  Widget yazilar() {
    return Text(
      ("${sonuc.toStringAsFixed(1)} ₺"),
      style: TextStyle(fontSize: 24),
    );
  }

  void verileriInternettenCek() async {
    Uri uri = Uri.parse(_baseURL + _apiKey); // link
    asd.Response r1 = await asd.get(uri); // cevabı getir
    Map<String, dynamic> parsedResponse =
        jsonDecode(r1.body); // json'i dart haritasına çeviriyorsun

    Map<String, dynamic> rates = parsedResponse["rates"];
    double? baseTLKuru = rates["TRY"];

    await Future.delayed(Duration(seconds: 3));

    if (baseTLKuru != null) {
      for (String ulkeKuru in rates.keys) {
        // "AUD" "CAD" "CHF" ...

        double? baseKur = double.tryParse(
            rates[ulkeKuru].toString()); // 1.566015 1.566015 1.566015 ...

        if (baseKur != null) {
          double tlKuru = baseTLKuru / baseKur; // her birinin tl karşılığı
          oranlar[ulkeKuru] = tlKuru;
        }
      }

      setState(() {});
    }
  }
}

/*
({
    "success":  ,
    "timestamp": 1519296206,                                      
    "base": "EUR",                      
    "date": "2021-03-17",
    "rates": {
        "AUD": 1.566015,
        "CAD": 1.560132,
        "CHF": 1.154727,
        "CNY": 7.827874,
        "GBP": 0.882047,
        "TRY": 60,
        "USD": 2,
    [...]
    }
})

*/