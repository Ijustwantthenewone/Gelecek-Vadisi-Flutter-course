import 'package:dart_dersleri/nesne_tabanli_programlama/fonksiyonlar.dart';
// void iş
void main(){
  var f = Fonksiyonlar();
  f.merhaba();

  String gelen = f.isim();
  print(gelen);

  f.selamla3("Zeynep");

  int gelen2 = f.toplam(11, 3);
  print(gelen2);

}

