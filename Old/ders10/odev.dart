class Araba {
  String marka;
  String model;
  int yili;
  String beygirGucu;
  int km;
  bool otomatikMi;
  bool elektrikliMi;

  Araba(this.marka, this.model, this.yili, this.beygirGucu, this.km,
      this.otomatikMi, this.elektrikliMi);

  void arabaCalistir() {
    print("Araba Çalıştırıldı");
  }

  void hizArttir(int yeniHiz) {
    print("Önceki hızınız ${this.km}");
    this.km = this.km + yeniHiz;
    print("Yeni hızınız ${this.km}");
  }

  void hizAzalt(int yeniHiz) {
    print("Önceki hızınız ${this.km}");
    this.km -= yeniHiz;
    print("Yeni hızınız ${this.km}");
  }
}

void main() {
  Araba Toyota = Araba("Toyota", "Pruis", 2024, "400 HP", 100, true, true);
  Araba Tesla = Araba("Toyota", "10x", 2024, "1111 HP", 350, false, false);
  Araba Opel = Araba("Opel", "Corsa", 2024, "444 HP", 200, true, false);
  Toyota.hizAzalt(15);
  Toyota.hizArttir(34);

  List<Araba> listem = [
    Araba("Toyota", "Camry", 341, "413", 555, true, false),
    Araba("Mercedes", "CLA", 55, "4635413", 111, true, false),
    Araba("Peugeot", "508", 34441, "5452", 340, true, false),
  ];
  listem.add(Araba("Dodge", "Viper", 2024, "234", 23, true, true));

  for (var a1 in listem) {
    a1.arabaCalistir();
  }
}
