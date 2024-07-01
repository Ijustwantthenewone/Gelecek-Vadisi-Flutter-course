import 'sekil.dart';

class Ucgen extends Sekil {
  Ucgen(super.genislik, super.yukseklik);

  @override
  alanHesapla() {
    return (genislik * yukseklik) / 2; // buna override yani üzerine yazma denir.
  }
}
