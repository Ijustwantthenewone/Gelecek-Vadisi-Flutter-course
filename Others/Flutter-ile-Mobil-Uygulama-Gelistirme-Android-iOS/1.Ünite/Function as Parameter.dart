
void main() {
  double sonuc = bol(15, 5, yazdir);
  print(sonuc);
}

double bol(int bolunen, int bolen, Function v1) {
  v1(); // bunu dene
  return bolunen / bolen;
}

void yazdir() {
  print("Merhaba dünya");
}



















/*

void main() {
  double sonuc = bol(15, 5, yazdir);
  print(sonuc);
}

double bol(int bolunen, int bolen, Function fonk) {
  fonk();
  return bolunen / bolen;
}

void yazdir() {
  print("Merhaba dünya");
}

*/






/*
import 'functions.dart';

void main() {
  double sonuc = bol(15, 5, yazdir);
  yazdir();
  print(sonuc);
}

double bol(int bolunen, int bolen, Function fonk) {
  return bolunen / bolen;
}

void yazdir() {
  print("Merhaba dünya");
}



// () bu varsa döndürür döndürdüğünü versin demek
// fonksiyon bir şey döndürmüyorsa direk sadece kendisini yazmamiz yeterli
*/

