enum Departman {
  // Girilecek yazım hatalarının önüne geçiyorsun
  yazilim1,
  departman1,
  pazarlama1
}

class Calisan {
  late String ad;
  Departman departman;

  Calisan(this.ad, this.departman);
}

void main() {
  Calisan c1 = Calisan("Ahmet", Departman.yazilim1);
  Calisan c2 = Calisan("Mehmet", Departman.pazarlama1);
  Calisan c3 = Calisan("Christen", Departman.yazilim1);
}





























// class Calisanlar {
//   late String ad;
//   late String soyad;
//   late int maas;


//   /// Çalışanın telefonunu tutan
//   late int telefon;
//   late String adres;
// }
