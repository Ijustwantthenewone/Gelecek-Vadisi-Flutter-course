class Calisan {
  String ad;
  String soyad;
  int maas;
  int telefon;

  ///Çalışanın açık adresini tutmak için
  String adres;

  Calisan(this.ad, this.soyad, this.maas, this.telefon, this.adres);
}

// This sınıftaki değişkeni alır.
// late veri vericeğine dair garanti vermek
// Constructor sınıftan bir nesne oluşturduğumuzda ilk bu çalışır


/*
  Calisan(this.ad, this.soyad, this.maas, this.telefon, this.adres);
  
  bu ile alttaki aynı ifade!

Calisan(String ad, String soyad, int maas, int telefon, String adres ) {
    this.ad = ad;
    this.soyad = soyad;
    this.maas = maas;
    this.telefon = telefon;
    this.adres = adres;
  }
*/