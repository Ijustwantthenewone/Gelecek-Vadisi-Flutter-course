class Calisan {
  String ad;
  String soyad;
  int maas;
  int telefon;

  String adres;

  Calisan({
    required this.ad,
    required this.soyad,
    required this.maas,
    this.telefon = 341134,
    this.adres = "Beylikdüzü",
  });
}

// Hem isimlendirilmiş hemde zorunlu olmasını istiyorsak {requried}