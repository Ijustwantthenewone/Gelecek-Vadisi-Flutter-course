class Calendarmodel {
  Veri? veri;

  Calendarmodel({this.veri});

  Calendarmodel.fromJson(Map<String, dynamic> json) {
    veri = json['Veri'] != null ? Veri.fromJson(json['Veri']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (veri != null) {
      data['Veri'] = veri!.toJson();
    }
    return data;
  }
}

class Veri {
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
  Arkayuz? arkayuz;

  Veri(
      {this.miladiTarih,
      this.hicriTarih,
      this.hicriSemsi,
      this.rumi,
      this.hizirKasim,
      this.gunDurumu,
      this.ezaniDurum,
      this.gununSozu,
      this.gununOlayi,
      this.isimYemek,
      this.arkayuz});

  Veri.fromJson(Map<String, dynamic> json) {
    miladiTarih = json['MiladiTarih'];
    hicriTarih = json['HicriTarih'];
    hicriSemsi = json['HicriSemsi'];
    rumi = json['Rumi'];
    hizirKasim = json['HizirKasim'];
    gunDurumu = json['GunDurumu'];
    ezaniDurum = json['EzaniDurum'];
    gununSozu = json['GununSozu'];
    gununOlayi = json['GununOlayi'];
    isimYemek = json['IsimYemek'];
    arkayuz =
        json['Arkayuz'] != null ?  Arkayuz.fromJson(json['Arkayuz']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['MiladiTarih'] = miladiTarih;
    data['HicriTarih'] = hicriTarih;
    data['HicriSemsi'] = hicriSemsi;
    data['Rumi'] = rumi;
    data['HizirKasim'] = hizirKasim;
    data['GunDurumu'] = gunDurumu;
    data['EzaniDurum'] = ezaniDurum;
    data['GununSozu'] = gununSozu;
    data['GununOlayi'] = gununOlayi;
    data['IsimYemek'] = isimYemek;
    if (arkayuz != null) {
      data['Arkayuz'] = arkayuz!.toJson();
    }
    return data;
  }
}

class Arkayuz {
  String? baslik;
  String? yazi;

  Arkayuz({this.baslik, this.yazi});

  Arkayuz.fromJson(Map<String, dynamic> json) {
    baslik = json['Baslik'];
    yazi = json['Yazi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Baslik'] = baslik;
    data['Yazi'] = yazi;
    return data;
  }
}
