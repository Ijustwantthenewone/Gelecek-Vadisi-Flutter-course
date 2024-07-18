main() {
  // isimsiz fonksiyon

  Function f1 = (int sayi, int sayi2) {
    // Değer döndürmeyelebilir
    int toplam = sayi + sayi2;
    print(toplam);
  };

  //Değer döndürebilir
  var f2 = (int sayi1) {
    return sayi1 * 2;
  };

  f1(23, 22);
  print(f2(4));

  Function f1e = (int sayi44, int sayi445) =>
      print(sayi44 + sayi445); // olay bunların bir isme sahip olmaması

  f1e(34, 34);
}
