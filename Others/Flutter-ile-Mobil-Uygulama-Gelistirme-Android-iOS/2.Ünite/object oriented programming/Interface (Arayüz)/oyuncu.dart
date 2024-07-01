import 'aksiyon.dart';
import 'controlable.dart';

class Oyuncu implements Aksiyon, Controlable {
  @override
  void ol() {
    print("Oyuncu öldü");
  }

  @override
  void saldir() {
    print("Saldırdı");
  }

  @override
  void savunma() {
    print("Oyuncu savunma yaptı");
  }

  @override
  void kos() {
    print("Koşuldu");
  }

  @override
  void yuru() {
    print("Yurundu");
  }

  @override
  void zipla() {
    print("Zıplandı");
  }
}
