import 'package:dart_dersleri/nesne_tabanli_programlama/konserve_boyut.dart';

void main(){
  ucretHesaplama(KonserveBoyut.orta);
}

void ucretHesaplama(KonserveBoyut b1){
    switch(b1){
      case KonserveBoyut.kucuk :{
        print("Ücret 5 ₺");
        break;
      }
      case KonserveBoyut.orta : {
        print("Ücret 10 ₺");
        break;
      }
      case KonserveBoyut.buyuk:{
        print("Ücret 15 ₺");
        break;
      }
    }
    
}