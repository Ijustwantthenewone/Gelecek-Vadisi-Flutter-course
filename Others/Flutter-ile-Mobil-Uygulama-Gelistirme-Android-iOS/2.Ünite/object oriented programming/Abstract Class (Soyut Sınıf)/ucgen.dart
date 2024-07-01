import 'sekil.dart';

class Ucgen extends Sekil {
  Ucgen(super.genislik, super.yukseklik);

  @override
  alanHesapla() {
    return (genislik * yukseklik) /
        2; // buna override yani üzerine yazma denir.
  }

  //bu sadece bir belirteç
  @override // Üzerine yazma, üst sınıftaki fonksiyonu geçersiz kılıp o fonksiyonu burada tanımlıyordu.
  void yazdir() {
    print("Üçgen çizildi");
  }
}
