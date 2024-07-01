abstract class Sekil {
  // Soyut fonksiyon tanımlarsan soyut sınıf tanımlamak zorundasın. abstract bu işte
  double genislik;
  double yukseklik;

  Sekil(this.genislik, this.yukseklik);

  alanHesapla() {
    return genislik * yukseklik;
  }

  void
      yazdir(); //Buna soyut fonksiyon denir somut değil çünkü bir işlevi yok tek bir görevi var alt sınıflara bunu kullanmaya mecbur tutuyor.
} //Bu sınıfın çocuklarına bu fonksiyonu kullanmaya zorluyoruz kullanmazlarsa hata alacakları
