void main() {
  final listem = <int>[];
  listem.add(11);
  listem.add(13);
  listem.add(45);
  listem.add(56);
  listem.add(-76);
  listem.sort();
  print(listem);

  final digerListe = <String>[];
  digerListe.add("Google");
  digerListe.add("Apple");
  digerListe.add("ChatGPT");
  digerListe.add("Gemini");

  var deneme = digerListe.where((element) => element.contains("A",));
  print(deneme);
}
