import 'package:dart_dersleri/nesne_tabanli_programlama/composition/kategoriler.dart';
import 'package:dart_dersleri/nesne_tabanli_programlama/composition/yonetmenler.dart';

class Filmler {
  int film_id;
  String film_ad;
  int film_yil;
  Kategoriler k1;
  Yonetmenler y1;

  Filmler({required this.film_id,required this.film_ad,required this.film_yil, required this.k1, required this.y1});
}
