import 'calisan.dart';

void main() {
  Calisan c1 = Calisan("Ahmet", "Soyad", 12, 349123123, "Yenibosna"); //bu sağdaki kısım Constructor çağırma!
  c1.ad = "Ahmet";
  c1.soyad = "Yılmaz";
  c1.maas = 4500;
  c1.telefon = 0541584734;

  print(c1.adres);
}
