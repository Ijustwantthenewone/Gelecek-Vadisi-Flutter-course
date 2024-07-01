import 'package:dart_dersleri/tekrar/class.dart';

void main(){
  int Months = 2;

  do{
    Months+=1;
    print(Months);
  }while(Months<= 4);

  Isimler isimler = Isimler.Ahmet;
  switch(isimler){
    case Isimler.Mehmet :{
      print("Mehmet oldu");
      break;
    }
    case Isimler.Ahmet : {
      print("Geçmiş olsun");
    }
  }

}