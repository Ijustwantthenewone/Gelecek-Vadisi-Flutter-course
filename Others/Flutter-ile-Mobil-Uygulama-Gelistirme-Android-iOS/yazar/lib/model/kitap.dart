class Kitap {
  int? id;
  String isim;
  DateTime olusturulmaTarihi;
  int katogori;

  Kitap(this.isim, this.olusturulmaTarihi, this.katogori);

  Kitap.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        isim = map["isim"],
        olusturulmaTarihi =
            DateTime.fromMillisecondsSinceEpoch(map["olusturulmaTarihi"]),
        katogori = map["kategori"] ?? 0;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "isim": isim,
      "olusturulmaTarihi": olusturulmaTarihi.millisecondsSinceEpoch,
      "kategori" : katogori,
    };
  }
}
