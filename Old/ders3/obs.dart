void main() {
  int sinavNotu = 1100;
  if (sinavNotu >= 90 && sinavNotu <= 100) {
    print("AA");
  } else if (sinavNotu >= 80 && sinavNotu < 90) {
    print("BA");
  } else if (sinavNotu >= 70 && sinavNotu < 80) {
    print("BB");
  } else if (sinavNotu >= 60 && sinavNotu < 70) {
    print("CB");
  } else if (sinavNotu >= 50 && sinavNotu < 60) {
    print("CC");
  } else if (sinavNotu >= 0 && sinavNotu < 50) {
    print("FF");
  } else {
    print("Hatalı veri girişi yaptınız");
  }
}
