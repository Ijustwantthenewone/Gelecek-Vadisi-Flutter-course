class PrayerModel {
  Cityinfo? cityinfo;

  PrayerModel({this.cityinfo});

  PrayerModel.fromJson(Map<String, dynamic> json) {
    cityinfo = json['cityinfo'] != null
        ? Cityinfo.fromJson(json['cityinfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cityinfo != null) {
      data['cityinfo'] = cityinfo!.toJson();
    }
    return data;
  }
}

class Cityinfo {
  List<Vakit>? vakit;

  Cityinfo({this.vakit});

  Cityinfo.fromJson(Map<String, dynamic> json) {
    if (json['vakit'] != null) {
      vakit = <Vakit>[];
      json['vakit'].forEach((v) {
        vakit!.add(Vakit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vakit != null) {
      data['vakit'] = vakit!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vakit {
  Attributes? attributes;
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

  Vakit(
      {this.attributes,
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
      this.kible});

  Vakit.fromJson(Map<String, dynamic> json) {
    attributes = json['@attributes'] != null
        ? Attributes.fromJson(json['@attributes'])
        : null;
    imsak = json['imsak'];
    sabah = json['sabah'];
    gunes = json['gunes'];
    israk = json['israk'];
    dahve = json['dahve'];
    kerahet = json['kerahet'];
    ogle = json['ogle'];
    ikindi = json['ikindi'];
    asrisani = json['asrisani'];
    isfirar = json['isfirar'];
    aksam = json['aksam'];
    istibak = json['istibak'];
    yatsi = json['yatsi'];
    isaisani = json['isaisani'];
    geceyarisi = json['geceyarisi'];
    teheccud = json['teheccud'];
    seher = json['seher'];
    kible = json['kible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (attributes != null) {
      data['@attributes'] = attributes!.toJson();
    }
    data['imsak'] = imsak;
    data['sabah'] = sabah;
    data['gunes'] = gunes;
    data['israk'] = israk;
    data['dahve'] = dahve;
    data['kerahet'] = kerahet;
    data['ogle'] = ogle;
    data['ikindi'] = ikindi;
    data['asrisani'] = asrisani;
    data['isfirar'] = isfirar;
    data['aksam'] = aksam;
    data['istibak'] = istibak;
    data['yatsi'] = yatsi;
    data['isaisani'] = isaisani;
    data['geceyarisi'] = geceyarisi;
    data['teheccud'] = teheccud;
    data['seher'] = seher;
    data['kible'] = kible;
    return data;
  }
}

class Attributes {
  String? tarih;
  String? gun;
  String? hicri;

  Attributes({this.tarih, this.gun, this.hicri});

  Attributes.fromJson(Map<String, dynamic> json) {
    tarih = json['tarih'];
    gun = json['gun'];
    hicri = json['hicri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tarih'] = tarih;
    data['gun'] = gun;
    data['hicri'] = hicri;
    return data;
  }
}









/*
{
    "cityinfo": {
        "vakit": [
            {
                "@attributes": {
                    "tarih": "2024-01-01",
                    "gun": "1",
                    "hicri": "19 CEMÂZİL-ÂHIR 1445"
                },
                "imsak": "06:33",
                "sabah": "06:50",
                "gunes": "08:22",
                "israk": "09:17",
                "dahve": "12:13",
                "kerahet": "12:56",
                "ogle": "13:19",
                "ikindi": "15:39",
                "asrisani": "16:16",
                "isfirar": "17:08",
                "aksam": "17:54",
                "istibak": "18:50",
                "yatsi": "19:31",
                "isaisani": "19:42",
                "geceyarisi": "00:13",
                "teheccud": "02:20",
                "seher": "04:26",
                "kible": "11:12"
            },
            {
                "@attributes": {
                    "tarih": "2024-01-02",
                    "gun": "2",
                    "hicri": "20 CEMÂZİL-ÂHIR 1445"
                },
                "imsak": "06:33",
                "sabah": "06:51",
                "gunes": "08:22",
                "israk": "09:17",
                "dahve": "12:14",
                "kerahet": "12:56",
                "ogle": "13:19",
                "ikindi": "15:40",
                "asrisani": "16:17",
                "isfirar": "17:09",
                "aksam": "17:55",
                "istibak": "18:51",
                "yatsi": "19:31",
                "isaisani": "19:42",
                "geceyarisi": "00:14",
                "teheccud": "02:20",
                "seher": "04:26",
                "kible": "11:12"
            },
            {
                "@attributes": {
                    "tarih": "2024-01-03",
                    "gun": "3",
                    "hicri": "21 CEMÂZİL-ÂHIR 1445"
                },
                "imsak": "06:33",
                "sabah": "06:51",
                "gunes": "08:22",
                "israk": "09:17",
                "dahve": "12:14",
                "kerahet": "12:57",
                "ogle": "13:20",
                "ikindi": "15:41",
                "asrisani": "16:18",
                "isfirar": "17:10",
                "aksam": "17:56",
                "istibak": "18:52",
                "yatsi": "19:32",
                "isaisani": "19:43",
                "geceyarisi": "00:15",
                "teheccud": "02:21",
                "seher": "04:27",
                "kible": "11:13"
            },
            {
                "@attributes": {
                    "tarih": "2024-01-04",
                    "gun": "4",
                    "hicri": "22 CEMÂZİL-ÂHIR 1445"
                },
                "imsak": "06:34",
                "sabah": "06:51",
                "gunes": "08:22",
                "israk": "09:17",
                "dahve": "12:15",
                "kerahet": "12:57",
                "ogle": "13:20",
                "ikindi": "15:42",
                "asrisani": "16:19",
                "isfirar": "17:11",
                "aksam": "17:57",
                "istibak": "18:53",
                "yatsi": "19:33",
                "isaisani": "19:44",
                "geceyarisi": "00:15",
                "teheccud": "02:21",
                "seher": "04:27",
                "kible": "11:14"
            },
            {
                "@attributes": {
                    "tarih": "2024-01-05",
                    "gun": "5",
                    "hicri": "23 CEMÂZİL-ÂHIR 1445"
                },
                "imsak": "06:34",
                "sabah": "06:51",
                "gunes": "08:22",
                "israk": "09:17",
                "dahve": "12:16",
                "kerahet": "12:58",
                "ogle": "13:20",
                "ikindi": "15:43",
                "asrisani": "16:20",
                "isfirar": "17:12"
*/