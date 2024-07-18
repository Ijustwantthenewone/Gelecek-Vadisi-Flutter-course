import 'dart:convert';

Yaprak yaprakFromJson(String str) => Yaprak.fromJson(json.decode(str));

String yaprakToJson(Yaprak data) => json.encode(data.toJson());

class Yaprak {
  Yaprak({
     this.miladiTarih,
     this.hicriTarih,
     this.hicriSemsi,
     this.rumi,
     this.hizirKasim,
     this.gunDurumu,
     this.ezaniDurum,
     this.gununSozu,
     this.gununOlayi,
     this.isimYemek,
     this.arkayuz,
  });

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

  factory Yaprak.fromJson(Map<String, dynamic> json) => Yaprak(
    miladiTarih: json["MiladiTarih"],
    hicriTarih: json["HicriTarih"],
    hicriSemsi: json["HicriSemsi"],
    rumi: json["Rumi"],
    hizirKasim: json["HizirKasim"],
    gunDurumu: json["GunDurumu"],
    ezaniDurum: json["EzaniDurum"],
    gununSozu: json["GununSozu"],
    gununOlayi: json["GununOlayi"],
    isimYemek: json["IsimYemek"],
    arkayuz: Arkayuz.fromJson(json["Arkayuz"]),
  );

  Map<String, dynamic> toJson() => {
    "MiladiTarih": miladiTarih,
    "HicriTarih": hicriTarih,
    "HicriSemsi": hicriSemsi,
    "Rumi": rumi,
    "HizirKasim": hizirKasim,
    "GunDurumu": gunDurumu,
    "EzaniDurum": ezaniDurum,
    "GununSozu": gununSozu,
    "GununOlayi": gununOlayi,
    "IsimYemek": isimYemek,
    "Arkayuz": arkayuz?.toJson(),
  };
}

class Arkayuz {
  Arkayuz({
     this.baslik,
     this.yazi,
  });

  String? baslik;
  String? yazi;

  factory Arkayuz.fromJson(Map<String, dynamic> json) => Arkayuz(
    baslik: json["Baslik"],
    yazi: json["Yazi"],
  );

  Map<String, dynamic> toJson() => {
    "Baslik": baslik,
    "Yazi": yazi,
  };
}