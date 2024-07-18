import 'package:dart_dersleri/nesne_tabanli_programlama/kalitim/ev.dart';
import 'package:dart_dersleri/nesne_tabanli_programlama/kalitim/saray.dart';
import 'package:dart_dersleri/nesne_tabanli_programlama/kalitim/villa.dart';

void main(){
   var yildizSarayi = Saray(kuleSayisi: 9, pencereSayisi: 5);
   print(yildizSarayi.kuleSayisi);
   print(yildizSarayi.pencereSayisi);

   var zenginVillasi = Villa(garajVarmi: true, pencereSayisi: 6);
   print(zenginVillasi.garajVarmi);
   print(zenginVillasi.pencereSayisi);
   
   if(yildizSarayi is Villa){
     print("Evet");
   }else{
     print("Hayır");
   }

   var e1 = Ev(pencereSayisi: 29); //Downcasting
   var donusmusHali = e1 as Villa;

   //Upcasting
   var zz1 = Villa(garajVarmi: false, pencereSayisi: 44);
   Ev e = zz1;
}