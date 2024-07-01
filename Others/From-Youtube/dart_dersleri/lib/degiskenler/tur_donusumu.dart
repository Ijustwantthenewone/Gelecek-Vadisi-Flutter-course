void main(){
 //Sayısaldan sayısala dönüşüm

  int x = 23;
  double y = 13.2;

  int sonuc1 = y.toInt();
  double sonuc = x.toDouble();
  print(sonuc1);
  print(sonuc);

  //Sayısaldan metine dönüşüm
  print(y.toString());
  print(x.toString());

  //Metinden sayısala dönüşüm
  String sayi1 = "150";
  String sayi2 = "398";

  int bilmem = int.parse(sayi1);
  double bilmem2 = double.parse(sayi2);
  print(bilmem);
  print(bilmem2);
}