// To parse this JSON data, do
//
//     final timeModel = timeModelFromJson(jsonString);

import 'dart:convert';

TimeModel timeModelFromJson(String str) => TimeModel.fromJson(json.decode(str));

String timeModelToJson(TimeModel data) => json.encode(data.toJson());

class TimeModel {
  TimeModel({
     required this.cityinfo,
  });

  Cityinfo cityinfo;

  factory TimeModel.fromJson(Map<String, dynamic> json) => TimeModel(
        cityinfo: Cityinfo.fromJson(json["cityinfo"]),
      );

  Map<String, dynamic> toJson() => {
        "cityinfo": cityinfo.toJson(),
      };
}



class Cityinfo {
  Cityinfo({
    required this.vakit,
  });

  Vakit vakit;

  factory Cityinfo.fromJson(Map<String, dynamic> json) => Cityinfo(
        vakit: Vakit.fromJson(json["vakit"]),
      );

  Map<String, dynamic> toJson() => {
        "vakit": vakit.toJson(),
      };
}

class Vakit {
  Vakit({
     this.imsak,
     this.sabah,
     this.gunes,
     this.israk,
     this.dahve,
     this.kerahet,
     this.ogle,
     this.ikindi,
     this.asrisani,
     this.isfirar,
     this.aksam,
     this.istibak,
     this.yatsi,
     this.isaisani,
     this.geceyarisi,
     this.teheccud,
     this.seher,
     this.kible
  });

  String? imsak;
  String? sabah;
  String? gunes;
  String? israk;
  String? dahve;
  String? kerahet;
  String? ogle;
  String? ikindi;
  String? asrisani;
  String? isfirar;
  String? aksam;
  String? istibak;
  String? yatsi;
  String? isaisani;
  String? geceyarisi;
  String? teheccud;
  String? seher;
  String? kible;

  factory Vakit.fromJson(Map<String, dynamic> json) => Vakit(
        imsak: json["imsak"],
        sabah: json["sabah"],
        gunes: json["gunes"],
        israk: json["israk"],
        dahve: json["dahve"],
        kerahet: json["kerahet"],
        ogle: json["ogle"],
        ikindi: json["ikindi"],
        asrisani: json["asrisani"],
        isfirar: json["isfirar"],
        aksam: json["aksam"],
        istibak: json["istibak"],
        yatsi: json["yatsi"],
        isaisani: json["isaisani"],
        geceyarisi: json["geceyarisi"],
        teheccud: json["teheccud"],
        seher: json["seher"],
        kible: json["kible"],
      );

  Map<String, dynamic> toJson() => {
        "imsak": imsak,
        "sabah": sabah,
        "gunes": gunes,
        "israk": israk,
        "dahve": dahve,
        "kerahet": kerahet,
        "ogle": ogle,
        "ikindi": ikindi,
        "asrisani": asrisani,
        "isfirar": isfirar,
        "aksam": aksam,
        "istibak": istibak,
        "yatsi": yatsi,
        "isaisani": isaisani,
        "geceyarisi": geceyarisi,
        "teheccud": teheccud,
        "seher": seher,
        "kible": kible,
      };
}
