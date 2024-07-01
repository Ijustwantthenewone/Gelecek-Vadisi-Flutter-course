import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prayertimes/models/prayermodel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class PrayerService {
  Future<List<Vakit>> cek(String sehir, String tarih) async {
    final _url =
        "https://www.turktakvim.com/XMLservis.php?tip=vakit&cityID=$sehir&format=json";
    http.Response response = await http.get(Uri.parse(_url));

    Map<String, dynamic> data = json.decode(response.body);
    List<dynamic> vakitlerListesi = data["cityinfo"]["vakit"];

    List<Vakit> prayerTimes = vakitlerListesi
        .map((json) => Vakit.fromJson(json))
        .where((vakit) => vakit.attributes!.tarih == tarih)
        .toList();

    return prayerTimes;
  }
}
