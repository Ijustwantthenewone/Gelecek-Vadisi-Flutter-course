class Calisan {
  String ad;
  String soyad;
  int maas;
  int telefon;
  String adres;

  Calisan(this.ad, this.soyad, this.maas, this.telefon,
      this.adres); // Alt sınıfın constructor olabilmesi için üst sınıfında olması şart
}

class Yazilimci extends Calisan {
  late String yazilimdili;

  Yazilimci(super.ad, super.soyad, super.maas, super.telefon, super.adres,
      this.yazilimdili);
  //Super üst sınıfı this bu sınıfı temsil ediyor.
}

class Pazarlamaci extends Calisan {
  String PazarlamaTeknigi;
  Pazarlamaci(super.ad, super.soyad, super.maas, super.telefon, super.adres,
      this.PazarlamaTeknigi);
}

class Tasarimci extends Calisan {
  String CizimProgramiAdi;
  Tasarimci(super.ad, super.soyad, super.maas, super.telefon, super.adres,
      this.CizimProgramiAdi);
}

void main() {
  Calisan y1 =
      Yazilimci("Ahmet", "Ordulu", 3444, 5416288733, "Beylikdüzü", "Python");
  y1 = Pazarlamaci("Ahmet", "Ordulu", 3431, 134, "Beylikdüzü", "İkna");
}
