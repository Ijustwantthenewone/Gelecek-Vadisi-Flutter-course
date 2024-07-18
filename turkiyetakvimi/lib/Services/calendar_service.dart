import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prayertimes/models/calendarmodel.dart';
import 'package:intl/intl.dart';

DateFormat formatter = DateFormat('yyyy-MM-dd');
DateTime d1 = DateTime.now();


class Calendarservice {
  String formatedDate = formatter.format(d1);


  Future<Veri> cek() async {
     final url =
      "https://www.turktakvim.com/JSONservis_takvim.php?baslangic=$formatedDate&bitis=$formatedDate&format=json";
    var response = await http.get(Uri.parse(url));
    List<dynamic> jsonData = jsonDecode(response.body);

    Map<String, dynamic> harita = jsonData[1]["Veri"];

    Veri v1 = Veri.fromJson(harita);

    return v1;
  }
}