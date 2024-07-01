class Calisan {
  String ad;
  String soyad;
  int? maas;
  int? telefon;
  String? adres;

  Calisan(
    this.ad,
    this.soyad,
    this.maas,
    this.telefon,
    this.adres,
  );

  Calisan.adSoyad(this.ad, this.soyad);
  Calisan.varsayilan(this.ad,this.soyad,{this.maas = 0,this.adres = "Beylikdüzü",this.telefon = 132414});
}