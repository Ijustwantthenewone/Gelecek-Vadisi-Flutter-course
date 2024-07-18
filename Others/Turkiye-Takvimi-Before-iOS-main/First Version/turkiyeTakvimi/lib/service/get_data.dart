import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:turkiyetakvimi/model/yaprakModel.dart';

import '../model/model.dart';

class DataService {
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  late final locName;

  Future<Vakit> getData(Position loc) async {
    print(loc.latitude);
    print(loc.longitude);

    Uri urlGetCity = Uri.parse(
        "https://www.turktakvim.com/XMLservis.php?tip=konum&latitude=${loc.latitude}&longitude=${loc.longitude}&limit=1&radius=45&format=json");

    var response = await http.post(
      urlGetCity,
      headers: {
        "content-type": "application/json",
      },
    );

    final json = jsonDecode(response.body);
    final locId = json["sehir"]["ID"];
    locName = json["sehir"]["CityNameTR"];

    Uri urlGetVakit = Uri.parse(
        "https://www.turktakvim.com/XMLservis.php?tip=vakit&baslangic=$formattedDate&bitis=$formattedDate&cityID=$locId&format=json");
    var response2 = await http.post(
      urlGetVakit,
      headers: {
        "content-type": "application/json",
      },
    );
    final json2 = jsonDecode(response2.body);
    TimeModel sa = TimeModel.fromJson(json2);
    return sa.cityinfo.vakit;
  }

  Future<Yaprak> getArka() async {
    Uri urlGetArka = Uri.parse(
        "https://www.turktakvim.com/JSONservis_takvim.php?baslangic=$formattedDate&bitis=$formattedDate&format=json");
    var response3 = await http.post(
      urlGetArka,
      headers: {
        "content-type": "application/json",
      },
    );
    final json3 = jsonDecode(response3.body);
    Yaprak sa = Yaprak(
        miladiTarih: json3[1]["Veri"]["MiladiTarih"],
        hicriTarih: json3[1]["Veri"]["HicriTarih"],
        hicriSemsi: json3[1]["Veri"]["HicriSemsi"],
        rumi: json3[1]["Veri"]["Rumi"],
        hizirKasim: json3[1]["Veri"]["HizirKasim"],
        gunDurumu: json3[1]["Veri"]["GunDurumu"],
        ezaniDurum: json3[1]["Veri"]["EzaniDurum"],
        gununSozu: json3[1]["Veri"]["GununSozu"],
        gununOlayi: json3[1]["Veri"]["GununOlayı"],
        isimYemek:json3[1]["Veri"]["IsimYemek"] ,
        arkayuz: Arkayuz(
            baslik: json3[1]["Veri"]["Arkayuz"]["Baslik"],
            yazi: json3[1]["Veri"]["Arkayuz"]["Yazi"]));
    return sa;
  }
}
