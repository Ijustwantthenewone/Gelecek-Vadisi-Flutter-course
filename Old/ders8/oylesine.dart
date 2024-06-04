void main() {
  print("Alışveriş listesine hoşgeldiniz \nYaptığınız işlemler");
  print("??????????????????");
  urunEkle("Defter");
  urunEkle("Kalem");
  urunEkle("Silgi");
  urunEkle("s");
}

List<String> urunListesi = [];

void urunEkle(String Adi) {
  if (Adi.length < 2) {
    print("Ürün adı 2 karakterden küçük olamaz --$Adi--");
  } else {
    urunListesi.add(Adi);
    print("Listeye $Adi eklendi");
  }
}
