import 'calisan.dart';

void main() {
  Calisan c1 = Calisan("Ahmet", "Soyad", 41, 45, "Beylikdüzü");

  c1.maasDegistir(3);
  print(c1.adres);
  print(c1.maasDegeriniGetir());
}
