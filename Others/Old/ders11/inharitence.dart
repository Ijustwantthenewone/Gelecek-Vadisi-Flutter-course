void main() {
  // Ebeveyn çocuk Bütün özelliklerin alıyor çocuk
  Arac a1 = Arac();

  Araba a2 = Araba();
  ucak U1 = ucak();
  elektrik e1 = elektrik();
  a2.calistir();
}

class Arac {
  String? renk;
  String? model;

  void calistir() {}
  void kapat() {}
  void hareketEt() {}

  toString() {
    return "$renk $model";
  }
}

class Araba extends Arac {
  @override
  void kapat() {
    // TODO: implement kapat
    super.kapat();
  }

  @override //üzerine yazma
  void calistir() {
    print("Çalıştırıldı");
    super.calistir(); //üst sınıfın calistirini tetikletetikle
  }
}

class ucak extends Arac {}

class elektrik extends Araba {
  void yapYap(int ekle) {
    print(ekle + 1111);
  }
}
