void main() {
  const a = 1;
  const b = 2;

  final List<int> listem = [a, b];
  const List<int> listem2 = [a, b];

  print(listem);
  print(listem2);

  // Sabitler sonradan değiştirilmeyi engeller.
  // final'i oluşturan ifadelerin final olmasına gerek yok
  //const'u oluşturan ifadelerin herpsinin const olması gerekir.
}










































/*
int sayi1 = 3;
  int sayi2 = 2;

  final List<int> tumSayilar = [sayi1, sayi2];
  print(tumSayilar);

  // final sabitini oluşturan ifadeler sabit olmaya bilir.
  // Const sabitinde onu oluşturanların hepsi sabit olmak zorundadır.
*/
