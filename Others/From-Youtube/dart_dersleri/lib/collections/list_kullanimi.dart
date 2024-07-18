void main(){
  var numaralar = [11,33,42]; //0:16 1: 33 2:42
  var meyveler = <int>[];
  // veri ekleme
  meyveler.add(3);
  meyveler.add(111);
  print(meyveler);

  //Güncelleme
   meyveler[1] = 859;
   print(meyveler);

   //insert
  meyveler.insert(0, 1111);
  print(meyveler);

  //veri okuma
   print(meyveler[1]);

   print(meyveler.length);
   print(meyveler.isNotEmpty);

   //for each
    for(var meyve in meyveler){
      print("Sonuç $meyve");
    } // 0 1 2
    for(var gosterilenler = 0 ;gosterilenler < meyveler.length;gosterilenler++){
        print("$gosterilenler = > ${meyveler[gosterilenler]}");
    }

    var listem = meyveler.reversed.toList();
    print(meyveler);
    print(listem);

    meyveler.sort();
    print(meyveler);

    meyveler.removeAt(0);
    print(meyveler);

    meyveler.clear();
    print(meyveler);
}