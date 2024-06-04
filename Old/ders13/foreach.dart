void main() {
  List Markalar = <String>["Toyota", "Opel", "Mercedes", "Volvo", "GMC"];
  Markalar.forEach((element) {
    print(element);
  });

  Set<int> setim = {1, 2, 3, 2, 4, 5};
  setim.forEach((element) {
    print(element);
  });

  Map<String, double> kilolar = {
    "Ahmet": 110.2,
    "Carrey": 120.4,
    "Christen": 90.3,
  };
  kilolar.forEach((key, value) {
    print("$key sonrasında $value");
  });
}
