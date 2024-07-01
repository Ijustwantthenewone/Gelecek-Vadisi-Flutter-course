import 'calisan.dart';

void main() {
  Calisan c1 = Calisan("Ahmet", "Korkmaz", null, null, null);
  Calisan c2 = Calisan.adSoyad("Ayşe", "Sönmez");
  Calisan c3 = Calisan.varsayilan("Ahmet", "Ordulu");
  print(c3.adres);
}
