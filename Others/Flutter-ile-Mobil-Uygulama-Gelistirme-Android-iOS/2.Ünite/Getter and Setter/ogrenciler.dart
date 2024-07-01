class Ogrenci {
  String ad;
  String soyad;
  int _harclik;
  int telefon;
  String adres;

  Ogrenci(this.ad, this.soyad, this._harclik, this.telefon, this.adres);

  int get harclik => _harclik;

  set harclik(int yeni) {
    _harclik = yeni;
  }
}









  /*
  harclik() => _harclik;

  setHarclik(int yeni) {
    _harclik = yeni;
  }
  */

