
void main() {
  Araba skoda = Araba(
      marka: "Skoda",
      model: "Pasta",
      modelyili: 2322,
      sifirAraba: false,
      Renk: "Turuncu"); // Nesneler

  skoda.marka = "Skoda";
  skoda.model = "Octavia";
  skoda.sifirAraba = true;

  print(skoda.modelyili);
}

class Araba {
  // Taslak

  String marka;
  String model;
  int modelyili;
  bool sifirAraba;
  String Renk;

  Araba( // {} isimlendirilmiş , [] opsiyonel
      {
    required this.marka,
    required this.model, //nesne oluşacağı zaman ilk  önce burası tetiklenir.
    required this.modelyili,
    required this.sifirAraba,
    required this.Renk,
  }) {
    print("Constructor oluşturuldu.");
  }
  void calistir() {}
  void durdur() {}
}
