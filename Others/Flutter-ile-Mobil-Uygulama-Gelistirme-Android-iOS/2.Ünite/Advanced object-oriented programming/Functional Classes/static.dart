class Matematik {
  static const double pi = 3.1; //Diyelim ki sabit olsun istiyoruz
//> static durağan-sabit demek bu öğe nesneden nesneye değişemez.
  static topla(double sayi1, double sayi2) {
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
  // artık pi'ye doğrudan sınıf üzerinden erişebiliriz.

  print(Matematik.pi);
  print(Matematik.topla(3, 2));
  Matematik m1 = Matematik();
  Matematik m2 = Matematik();

  print(m1.carp(3, 4));
}
