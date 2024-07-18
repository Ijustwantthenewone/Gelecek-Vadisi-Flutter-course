import 'dart:collection';

void main(){
  //tanimlama
  var plakalar = HashSet.from([16,34,11]);
  var meyveler = HashSet<String>();

  //değer atama
  meyveler.add("Selam");
  meyveler.add("Oradamısın");
  meyveler.add("Kesinlikle");

  meyveler.add("Oradamısın");
  print(meyveler);

  var gelen = meyveler.elementAt(0);
  print(gelen);

  print(meyveler.length);
  print(meyveler.isEmpty);

  for(var m in meyveler){
    print("Sonuç = $m");
  }

  for(var x = 0;x < meyveler.length;x++){
    print("$x ${meyveler.elementAt(x)}");
  }

  meyveler.remove("Selam");
  print(meyveler);

  meyveler.clear();
  print(meyveler);

  
}