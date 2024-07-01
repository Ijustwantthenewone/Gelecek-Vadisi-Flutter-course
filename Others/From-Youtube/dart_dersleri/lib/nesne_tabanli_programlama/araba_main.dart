import 'package:dart_dersleri/nesne_tabanli_programlama/araba.dart';

void main() {
  var mercedes = Araba(renk: "Red", hiz: 300, calisiyormu: false);
  //Değer atama
  mercedes.renk = "Yellow";
  mercedes.hiz = 330;
  mercedes.calisiyormu = true;

  mercedes.calistir();
  mercedes.bilgiAl();
  mercedes.hizlan(16);
  mercedes.bilgiAl();


  var volvo = Araba(renk: "Kırmızı", hiz: 220, calisiyormu: true);
  volvo.bilgiAl();
  volvo.yavasla(3);
  volvo.bilgiAl();

}
