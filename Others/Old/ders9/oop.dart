class Araba {
  Araba() {
    print("Araba nesnesi oluşturuldu");
  }

  String marka = "Opel";
  String model = "Corsa";
  int yili = 2021;
  int km = 40000;
  bool otomobil = true;

  calistir() {
    print("${marka} ${model} çalıştı !");
  }
}

main() {
  //class bir taslaktır bu taslaktan ürettiğimiz ise bir nesnedir.
  Araba Toyota = Araba();

  print(Toyota.km);
  Toyota.calistir();

  Araba Civic = Araba();
}
