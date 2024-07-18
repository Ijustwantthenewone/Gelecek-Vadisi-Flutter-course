import 'package:dart_dersleri/nesne_tabanli_programlama/composition/filmler.dart';
import 'package:dart_dersleri/nesne_tabanli_programlama/composition/kategoriler.dart';
import 'package:dart_dersleri/nesne_tabanli_programlama/composition/yonetmenler.dart';

void main(){
  var ka1 = Kategoriler(kategori_id: 1, kategori_ad: "Dram");
  var ka2 = Kategoriler(kategori_id: 2, kategori_ad: "Bilim kurgu");

  var yo1 = Yonetmenler(yonetmen_id: 1, yonetmen_ad: "Salamanca toraman");
  var yo2 = Yonetmenler(yonetmen_id: 2, yonetmen_ad: "Christopher Nolan");

  var m1 = Filmler(film_id: 2, film_ad: "Titanic", film_yil: 2023, k1: ka1, y1: yo2);

  print("Film id ${m1.film_id}");

  print(m1.y1.yonetmen_ad);


}