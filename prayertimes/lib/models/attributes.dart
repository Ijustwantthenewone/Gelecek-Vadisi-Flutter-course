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