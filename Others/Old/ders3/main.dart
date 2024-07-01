void main() {
  bool evetMi = true;
  print(!evetMi);

  int sayi = 20;
  int sayi2 = 201;

  if (sayi < sayi2) {
    print("Sayi 1 küçüktür.");
  } else if (sayi == sayi2) {
    print("Sayılar eşit");
  } else {
    print("Sayi2 küçüktür");
  }

  if (sayi != sayi2) {
    print("Sayilar birbirinden farklı");
  }
  int sayi3 = 22;
  // bir sayının 100 ile 200 arasında olma durumunu kontrol etme
  if (sayi3 > 100 && sayi3 < 200) {
    print("Arasında");
  } else {
    print("Arasında değildir");
  }

  if (sayi3 == 100 || sayi3 > 100) {
    print("Arasında");
  } else {
    print("Arasında değildir");
  }

  // || veya && ve

  /*
  
  String kullaniciAdi = "Ahmet";
  String parola = "123123123";

  if (kullaniciAdi == "Ahmeta") {
    print("Doğru");
  } else {
    print("Uygulamaya giriş yetkiniz yok");
  }
 */
}
