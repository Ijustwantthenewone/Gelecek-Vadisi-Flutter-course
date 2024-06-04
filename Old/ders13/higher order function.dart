void main() {
  //Eyer parametre olarak bir fonksiyon alıyorsa veya geriye değer yerine bir fonksiyon döndürüyorsa higher order function denir.
  Function sayilariTopla = (sayi1, sayi2) => sayi1 + sayi2;
  ornekMetot("Carrey", sayilariTopla);

  var fek =
      digerMetot(); // direk digerMetot'a gönderemiyoruz.
  print(fek(10));
  print(digerMetot()(4345));
}

void ornekMetot(String isim, Function f1) {
  // function f1 bunun yüzünden higher order function oluyor.
  print("Benim ismim : $isim");
  print(f1(3, 4));
}

Function digerMetot() {
  Function sayininKaresiniAl = (sayi1) => sayi1 * sayi1;
  return sayininKaresiniAl; // Geriye fonksiyon döndürüyor bu yüzden higer order function oluyor.
}
