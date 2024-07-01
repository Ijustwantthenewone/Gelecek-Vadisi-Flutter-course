
void main() {
  double sonuc = bol(6, 3);
  print(sonuc);
  bool sonuc2 = resitMi(40);
  bool sonuc3 = resitMi(13);
  print(sonuc2);
  print(sonuc3);
  yazdir();
}

double bol(int bolunen, int bolen) {
  print("Fonksiyon başladı.");
  return bolunen / bolen;
}

bool resitMi(int yas) {
  return yas >= 18;
}

void yazdir() {
  print("Merhaba dünya");
}

// void herhangi bir değer döndürmeyen fonksiyonlarda kullanılır.


















// void bir şey döndürmemesi anlamına geliyor.


// eyer void kullanıyorsak herhangi bir return ifadesi kullanamayız.

/*
void main() {
  double sonuc = bol(15, 5);
  print("Sonucu $sonuc");
  bool resitMi1 = resitMi(19);
  bool resitmi2 = resitMi(17);

  print(resitMi1);
  print(resitmi2);
  yazdir();
}

double bol(int bolunen, int bolen) {
  print("Fonksiyon başladı.");
  return bolunen / bolen;
}

bool resitMi(int yas) {
  return yas >= 18;
}

void yazdir() {
  print("Merhaba dünya");
}

// void bir şey döndürmemesi anlamına geliyor.


// eyer void kullanıyorsak herhangi bir return ifadesi kullanamayız.
*/