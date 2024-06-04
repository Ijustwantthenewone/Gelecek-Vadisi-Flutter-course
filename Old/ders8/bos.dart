void main() {
  // List<String> isimler = List.filled(10, "", growable: true);
  List<String> isimler = ["Furkan", "Ahmet", "Ali"];
  isimler.add("Fatma");
  isimler.add("Veli");
  isimler.add("Mehmet");


  listeYazdir(isimler);
  listeYazdir(isimler);
  listeYazdir(isimler);
  listeYazdir(isimler);
  listeYazdir(isimler);
  listeYazdir(isimler);
  listeYazdir(isimler);
  listeYazdir(isimler);
}

void listeYazdir(List<String> isimler) {
  print("---------------------");
  for (int i = 0; i < isimler.length; i++) {
    print("Katılımcı adı: " + isimler[i]);
  }
  print("---------------------");
}
