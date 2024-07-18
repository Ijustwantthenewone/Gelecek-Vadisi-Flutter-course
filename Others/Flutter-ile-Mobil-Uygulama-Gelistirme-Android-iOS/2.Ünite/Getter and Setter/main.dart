import 'ogrenciler.dart';

void main() {
  Ogrenci o1 = Ogrenci("Mehmet", "Sönmez", 4500, 5415388594, "Beylikdüzü");
  o1.harclik =
      13143; //setter çalışıyor.                   // getter setter özelliği değişkene değer atar gibi davranabilirsin
  print(o1.harclik); // getter çalışıyor .
}
