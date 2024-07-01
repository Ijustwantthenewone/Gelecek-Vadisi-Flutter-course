
void main() {
  List<String> alisverisListesi = [];

  void kontrol() {
    if (alisverisListesi.isEmpty) {
      print("Liste boştur.");
    } else if (alisverisListesi.isNotEmpty) {
      print("Liste doludur.");
    }
  }

  void ekle(String urunAdi) {
    if (urunAdi.length < 2) {
      print("Hatalı ürün ismi girdiniz !");
    } else {
      alisverisListesi.add(urunAdi);
    }
  }

  void sil(String neyiSil) {
    if (alisverisListesi.contains(neyiSil)) {
      alisverisListesi.remove(neyiSil);
    } else {
      print("Silinecek ürün bulunamadı");
    }
  }

  ekle("Apple mac mini m3");
  ekle("Xioami 13 Pro");
  ekle("Logitech Z114");
  ekle("M13");
  ekle("q34");
  ekle("ğ33");
  ekle("a11");
  ekle("g3");
  ekle("b6");
  print(alisverisListesi);
  sil("Logitech Z114");
  print(alisverisListesi);
  kontrol();
  print("----");

  for (int x = 0; x < alisverisListesi.length; x++) {
    int numara = x + 1;
    print("$numara ${alisverisListesi[x]}");
  }
}
