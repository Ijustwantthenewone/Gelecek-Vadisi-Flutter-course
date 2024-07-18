abstract class Sekil {
  double alanHesapla();
  double cevreHesapla();
}

class Dortgen extends Sekil {
  double kenar1;
  double kenar2;
  double kenar3;
  double kenar4;

  Dortgen(
      {required this.kenar1,
      required this.kenar2,
      required this.kenar3,
      required this.kenar4});

  @override
  double alanHesapla() {
    return (kenar1 * kenar2 * kenar3) / 2;
  }

  @override
  double cevreHesapla() {
    return kenar1 + kenar2 + kenar3 + kenar4;
  }
}

class Kare extends Dortgen {
  double kenar;
  Kare({required this.kenar})
      : super(
          kenar1: kenar,
          kenar2: kenar,
          kenar3: kenar,
          kenar4: kenar,
        );

  @override
  double alanHesapla() {
    return kenar * kenar;
  }
}
