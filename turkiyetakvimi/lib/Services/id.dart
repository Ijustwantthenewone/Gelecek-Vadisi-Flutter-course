import 'package:geolocator/geolocator.dart';
import 'package:prayertimes/Services/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:prayertimes/models/sehir_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class IdService {
  double? latitude;
  double? longitude;

  Future<int?> getId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool locationAvailable = await _getir();
    if (!locationAvailable) {
      // Location not available, do nothing
      return null;
    }

    String url =
        "https://www.turktakvim.com/XMLservis.php?tip=konum&latitude=$latitude&longitude=$longitude&limit=10&radius=45&format=json";

    var r1 = await http.get(Uri.parse(url));
    Map<String, dynamic> idler = json.decode(r1.body);
    SehirId s1 = SehirId.fromJson(idler);

    String? deger = s1.sehir![0].iD;
    String? sehir = s1.sehir![0].cityNameTR;

    int? saga = int.tryParse(deger!);
    await prefs.setInt('saga', saga!);

    await prefs.setString('sehir', sehir!);
    print(prefs.getString("sehir"));

    return saga;
  }

  Future<bool> _getir() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, do nothing
        print("Location permission denied");
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately
      print("Location permission permanently denied");
      return false;
    }

    await determinePosition().then(
      (value) {
        latitude = value.latitude;
        longitude = value.longitude;

        print(latitude);
        print(longitude);
      },
    );

    return true;
  }
}
