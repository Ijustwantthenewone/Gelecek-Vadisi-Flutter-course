abstract class Sekil {
  double alanHesapla();
  double cevreHesapla();
}

class dortGen extends Sekil {
  @override
  double alanHesapla() {
    return (5 * 9) / 2;
  }
  
  @override
  double cevreHesapla() {
    return (2 + 4) * 2;
  }
}

class ucgen extends Sekil {
  @override
  double alanHesapla() {
    return (10 * 3) / 2;
  }

  @override
  double cevreHesapla() {
    return 4 + 3 + 8;
  }
}

class Daire extends Sekil {
  double pi = 3.14;
  @override
  double alanHesapla() {
    return pi * (4 * 4);
  }

  @override
  double cevreHesapla() {
    return 2 * pi * 4;
  }
}

class Arac {}

class Tren extends Arac {}

class Ucak extends Arac {}

class Yuktreni extends Tren {
  double yukAgirligi;
  Yuktreni(this.yukAgirligi);
}

class Dikdortgen {}

class Kare {}

class EskenarUcgen {}

class DikUcgen {}

void main() {
  Arac a1 = Yuktreni(1000.34);
  Tren t1 = Yuktreni(1223.44);
   
}
