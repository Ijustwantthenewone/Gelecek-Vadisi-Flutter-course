import 'dart:convert';

import 'package:prayertimes/Services/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:prayertimes/models/sehir_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IdService {
  double? latitude;
  double? longitude;
  Future<int?> getId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await _getir();
    String _url =
        "https://www.turktakvim.com/XMLservis.php?tip=konum&latitude=$latitude&longitude=$longitude&limit=10&radius=45&format=json";

    var r1 = await http.get(Uri.parse(_url));
    Map<String, dynamic> idler = json.decode(r1.body);
    SehirId s1 = SehirId.fromJson(idler);
    String? deger = s1.sehir![0].iD;
    int? saga = int.tryParse(deger!);
    await prefs.setInt('saga', saga!);
    return saga;
  }

  Future<void> _getir() async {
    await determinePosition().then(
      (value) {
        latitude = value.latitude;
        longitude = value.longitude;

        print(latitude);
        print(longitude);
      },
    );
  }
}
