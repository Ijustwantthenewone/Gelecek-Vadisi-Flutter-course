import 'ejderha.dart';
import 'kartal.dart';

void main() {
  Kartal k1 = Kartal();
  k1.ucmaSuresi = 123;
  k1.ucusHizi = 4233;

  k1.ucmaSuresiniYazdir();
  k1.ucusHiziniYazdir();

  Ejderha e1 = Ejderha();
  e1.ucmaSuresi = 222;
  e1.ucusHizi = 445;
  e1.ucmaSuresiniYazdir();
  e1.ucusHiziniYazdir();
}
