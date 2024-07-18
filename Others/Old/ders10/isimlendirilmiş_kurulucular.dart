void main(List<String> args) {

  String adSoyad = "Furkan";

  Araba focus = Araba.sifirAraba(marka: "Ford", model: "Focus", renk: "Beyaz");
  print(focus.sifirArabaMi);

  // Araba t10x = Araba.ikinciEl(marka: marka, model: model, modelYili: modelYili, renk: renk);
}

class Araba {
  Araba({
    required this.marka,
    required this.model,
    required this.modelYili,
    required this.sifirArabaMi,
    required this.renk,
    required this.bayi,
  });

  Araba.sifirAraba({
    required this.marka,
    required this.model,
    required this.renk,
  }) {
    this.modelYili = 2024;
    this.sifirArabaMi = true;
    this.bayi = "Araba Bayisi";
  }

  Araba.ikinciEl({
    required this.marka,
    required this.model,
    required this.modelYili,
    required this.renk,
  }) {
    sifirArabaMi = false;
  }

  factory Araba.aracSatisi({
    required String marka,
    required String model,
    required int modelYili,
    required bool sifirArabaMi,
    required String renk,
    required String? bayi,
  }) {
    if (bayi != null) {
      return Araba.sifirAraba(
        marka: marka,
        model: model,
        renk: renk,
      );
    } else {
      return Araba.ikinciEl(
        marka: marka,
        model: model,
        modelYili: modelYili,
        renk: renk,
      );
    }
  }

  String marka;
  String model;
  late int modelYili;
  late bool sifirArabaMi;
  String renk;
  String? bayi;

  void calistir() {}

  void kapat() {}
}