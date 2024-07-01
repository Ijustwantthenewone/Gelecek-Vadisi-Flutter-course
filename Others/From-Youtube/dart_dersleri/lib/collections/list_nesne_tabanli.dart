import 'package:dart_dersleri/collections/ogrenciler.dart';

void main(){
  var o1 = Ogrenciler(no: 3, ad: "Mehmet", sinif: "9c");
  var o2 = Ogrenciler(no: 1, ad: "Ada", sinif: "4h");
  var o3 = Ogrenciler(no: 5, ad: "Samet", sinif: "1e");

  var ogrencilerListesi = <Ogrenciler>[];
  ogrencilerListesi.add(o1);
  ogrencilerListesi.add(o2);
  ogrencilerListesi.add(o3);

  for(var x in ogrencilerListesi){
    print("No ${x.no} Name ${x.ad} sinif ${x.sinif}");
  }

  Iterable<Ogrenciler> f1 = ogrencilerListesi.where((filtre) {
    return filtre.no > 2;
  });

  var sonuc = f1.toList();

  for (var x in sonuc){
    print("${x.no} ${x.ad} ${x.sinif}");
  }
  print("----");

  Iterable<Ogrenciler> f2 = ogrencilerListesi.where((filtre) {
    return filtre.ad.contains("e");
  });

  var sonuc1 = f2.toList();

  for (var x in sonuc1){
    print("${x.no} ${x.ad} ${x.sinif}");
  }


}