class Calisan {
  String ad;
  String soyad;
  int maas;
  int telefon;
  String adres;

  double _zam;

  Calisan(this.ad, this.soyad, this.maas, this.telefon, this.adres)
      : _zam = maas /
            10; // Otomatik atama için // Çalışan adında bir kapsül oluşturduk bu kapsüle dışarıdan ne kadar ulaşılmasını  istiyorsak o kadar izin veriyoruz.
}

void main() {
  Calisan c1 =
      Calisan("Ahmet", "Ordulu", 4500, 5416288099, "Yakuplu, beylikdüzü");
}
