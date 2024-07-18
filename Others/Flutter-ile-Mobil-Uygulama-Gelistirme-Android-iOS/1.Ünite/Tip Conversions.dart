void main() {
  String boy = "Cihan";
  String kilo = "90";

  double boyK = double.parse(boy);
  int kiloK = int.parse(kilo);

  double boyKiloEndeksi = kiloK / (boyK * boyK);

  print(boyKiloEndeksi);

  /*
  
  String kelime1 = "Selam";
  int kelime2 = 4;

  String yasSTR = kelime2.toString();

  String tamMetin = kelime1 + yasSTR;
  print(tamMetin);
  */
}
