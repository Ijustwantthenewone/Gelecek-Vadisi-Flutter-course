import 'dikdortgen.dart';
import 'kare.dart';
import 'ucgen.dart';

void main() {
  Kare k1 = Kare(10, 10);
  Dikdortgen d1 = Dikdortgen(15, 10);
  Ucgen u1 = Ucgen(20, 34);

  print(k1.alanHesapla()); 
  print(d1.alanHesapla()); // aynı duruma farklı tepkiler vermeye çok biçimlilik denir.
  print(u1.alanHesapla());

  //üst sınıfta sadece değişkenlere değil fonksiyonlara da ulaşabiliriz.
}