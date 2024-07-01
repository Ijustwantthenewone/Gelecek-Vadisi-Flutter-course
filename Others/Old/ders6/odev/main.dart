void main() {
  print("Şekil yazdırma programına hoşgeldiniz !");
  //ucgenCiz(10);
  kareCiz(70);
  // dikDorgenCiz(30);
}

ucgenCiz(int deger) {
  print("Üçgen yazdırılıyor !");
  int sayac = 1;
  var sonuc;
  while (sayac <= deger) {
    print("a" * sayac);
    sayac++;
  }
}

kareCiz(int deger2) {
  print("Kare çiziliyor !");
  for (int x = 1; x <= deger2; x++) {
    if (x == 1 || x == deger2) {
      print("a" * deger2);
    } else {
      String lim = "";
      for (int sayac = 1; sayac <= deger2; sayac++) {
        if (sayac == 1 || sayac == deger2) {
          lim += "a";
        } else {
          lim += " ";
        }
      }
      print(lim);
    }
  }
}

dikDorgenCiz(int deger3) {
  print("Dikdörtgen çiziliyor !");
  for (int x = 1; x <= deger3; x++) {
    if (x == 1 || x == deger3) {
      print("a" * deger3*2);
    } else {
      String lim = "";
      for (int sayac = 1; sayac <= deger3 * 2; sayac++) {
        if (sayac == 1 || sayac == deger3 * 2) {
          lim += "a";
        } else {
          lim += " ";
        }
      }
      print(lim);
    }
  }
}
