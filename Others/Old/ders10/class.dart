void main() {
  Ogrenci ogrenci1 = Ogrenci();
  ogrenci1.adSoyad = "Furkan Yağmur";
  ogrenci1.mezunMu = true;
  ogrenci1.ortalamaHesapla();
}

class Ogrenci {
  //Class içerisindeki değişkenlere field yani alan denir.
  String? adSoyad;
  int? yas;
  int? sinifi;
  double? gno;
  bool? mezunMu;

  ortalamaHesapla() {} //Buna metot veya fonksiyon denir.
}
