class Ogrenciler{
  int no;
  String ad;
  String sinif;

  Ogrenciler({required this.no,required this.ad,required this.sinif});
}

void main(){
  var b1 = Ogrenciler(no: 1, ad: "Kristen", sinif: "3");
  var b2 = Ogrenciler(no: 2, ad: "Mehmet", sinif: "4");
  var b3 = Ogrenciler(no: 4, ad: "Micheal", sinif: "11");

  List<Ogrenciler> Listem = <Ogrenciler>[];

  Listem.add(b1);
  Listem.add(b2);
  Listem.add(b3);

  List<int> sayilar = [334,11,64];
  List<int> sayilar1 = sayilar.where((element) => element %2 ==0).toList(); //HashSet İşlemleri
  print(sayilar1);
}