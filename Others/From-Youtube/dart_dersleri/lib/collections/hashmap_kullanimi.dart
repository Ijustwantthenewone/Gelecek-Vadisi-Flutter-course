import 'dart:collection';

void main(){
  //Tanımlama
  var Sayiler = {"Elektronik" : 1,"Giyim & ayakkabılar" : 2};
  var iller = HashMap<int,String>();

  //Değer atama
  iller[1] = "Toyoya";
  iller[3] = "BMW";
  print(iller);

  iller[1] = "Wolsvagen";
  print(iller);

  String i1 = iller[1].toString();
  print(i1);

  print(iller.length);

  var anahtarlar = Sayiler.keys;

  for(var x in anahtarlar){
    print("$x >> ${Sayiler[x]}");
  }

}