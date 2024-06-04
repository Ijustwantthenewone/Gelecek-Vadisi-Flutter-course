void main() {
  List<String> orgunEgitim = ["Furkan", "Ahmet", "Ayşe"];

  List<String> ikinciEgitim = [
    "Mehmet",
    "Ali",
    "Aslı",
  ];

  List<String> derseKatilanOgrenciler = [];

  derseKatilanOgrenciler.addAll([
    ...orgunEgitim, //3 nokta oparötürüne spread deniyor.
    ...ikinciEgitim
  ]);
  print(derseKatilanOgrenciler);
}
