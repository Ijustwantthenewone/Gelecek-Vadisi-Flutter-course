void main() {
  int bolunen1 = 15;
  int bolen1 = 0;

  int bolunen2 = 18;
  int bolen2 = 0;

  int bolunen3 = 24;
  int bolen3 = 0;

  bol(int bolunen, int bolen) {
    if (bolen != 0) {
      print(bolunen / bolen);
    } else {
      print("Bolen sıfır olamaz");
    }
  }

  bol(bolunen1, bolen1);
  bol(bolunen2, bolen2);
  bol(bolunen3, bolen3);
}

// aynı şeyler oluyorsa fonksiyon aklına gelsin
