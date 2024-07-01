void main() {
  yazdir("Ahmet", 11);
  yazdir("Ayşe", 31, meslek: "Öğretmen", sehir: "İzmir");
  yazdir("Zeynep", 80, meslek: "Doktor", sehir: "Bursa");
}

void yazdir(String isim, int yas, {String? meslek = "İşsiz", String? sehir}) {
  print("Merhaba $isim");
  print("Yaşınız $yas");
  print(meslek);
}

//isimlendirilmiş parametre {}
//Zorunlu parametreler daima başa yazılır.























/*
void main() {
  yazdir("Ali", 25);
  yazdir("Ayşe", 35, meslek: "Başkan", sehir: "Antalya");
  yazdir("Ahmet", 28, meslek: "Doktor", sehir: "Tekirdağ");
}

void yazdir(String isim, int yas, {String meslek = "İşsiz", String? sehir}) {
  print("Merhaba $isim");
  print("Yaşınız $yas");
  print("Mesleğiniz $meslek");

  if (sehir != null) {
    print("Yaşadığınız şehir $sehir");
  }
  print("");
}

//İsimlendirilmiş parametreler { } alınır.
*/