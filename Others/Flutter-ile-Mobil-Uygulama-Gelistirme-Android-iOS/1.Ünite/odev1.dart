void main() {
  Map<String, String> arabalar = {
    "Mercedes": "1000",
    "Toyota": "500",
    "Volvo": "600",
    "Renault": "800",
    "BMW": "1100",
  };

  for (String degerler in arabalar.keys) {
    String? keyler = arabalar[degerler];

    if (keyler != null) {
      int sayilar = int.parse(keyler);
      if (sayilar < 700) {
        print("$degerler çok ucuz");
      } else {
        print("$degerler çok pahalı");
      }
    } else {
      print("Geçersiz");
    }
  }
}
