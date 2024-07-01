class Matematik {
  double pi = 3.1;

  double topla(double sayi1, double sayi2) {
    return sayi1 + sayi2;
  }

  double cikar(double sayi1, double sayi2) {
    return sayi1 - sayi2;
  }

  double carp(double sayi1, double sayi2) {
    return sayi1 * sayi2;
  }

  double bol(double sayi1, double sayi2) {
    return sayi1 / sayi2;
  }
}

void main() {
  Matematik m1 = Matematik();
  Matematik m2 = Matematik();
  print(m1.carp(3, 4));
}
