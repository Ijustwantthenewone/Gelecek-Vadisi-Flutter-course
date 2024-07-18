class Calisan {
  String ad;
  String soyad;
  int maas;
  int _telefon;
  String adres;

  Calisan(this.ad, this.soyad, this.maas, this._telefon, this.adres);

  maasDegistir(int yenisi) {
    // setter fonksiyonu
    _telefon = yenisi;
  }

  int maasDegeriniGetir() {
    //getter fonksiyonu
    return _telefon;
  }
}

// _ private demek

// Public değerlere  sınıf dışından ulaşılabilir
// _ Private değerlere ise ulaşılamaz

// Değişken alt çizgi ile başlıyorsa _ private yoksa public tir.
// public sınıf dışından ulaşılabilir private ise ulaşılamaz.
