void main() {
  // sabit uzunluklu listeler
  // değişken uzunluklu listeler
  //dynamic sonradan değiştirilebiliyor.
  
  List<int> sayilar = List.filled(5, 1,growable: true); // 11111
  sayilar[2] = 3;
  //3. indexi 4 yap
  sayilar[3] = 4;
  print(sayilar);

  List<String> katilimcilar = List.filled(6, "Öğrenci");
  katilimcilar[0] = "Furkan";
  print(katilimcilar);

  List karisik = List.filled(10, null);
  karisik[1] = 1;
  karisik[2] = "Ahmet";

  print(karisik);
}
