void main() {
  List<String> listem = <String>["Mehmet", "Samet", "Ayşe", "Zeynep", "Ayşe"];

  listem.addAll(["Deniz", "İrem", "Hayalet"]);

  print(listem);
  print(listem.contains("irem")); // içerir

  print(listem.elementAt(1)); // o elemanı gösterir
  print(listem.indexOf("Samet")); // kaçıncı indexte olduğunu gösterir
  print("------------");
  print(listem.indexOf("Ayşe")); // kaçıncı indexte olduğunu gösterir
  print(listem.lastIndexOf(
      "Ayşe")); // Kaçıncı indexte olduğunu gösterir ama sondan geriye doğru

  print("------------");
  listem.insert(2, "Mehmet"); // o index'e ekler
  listem.shuffle(); // karıştırır
  print(listem);
  //1:02:24
  //githuba bak + ödev
  void listeYazdir(List<String> gelenler) {
    for (int x = 0; x < gelenler.length; x++) {
      print("Liste içindekiler ${gelenler[x]}");
    }
  }

  listeYazdir(listem);
}


// Değiştirilebilir uzunluk growable

/*
List<String> isimler2 = ["Ahmet", "Mehmet", "Samet"];
  print(isimler2);
  isimler2.add("Fatma");
  print(isimler2);
  print("İlk isim ${isimler2[0]}");
  isimler2.remove("Ahmet");
  print(isimler2);
  isimler2.removeAt(2);
  print("asd $isimler2");

  print(isimler2);
  print("Liste uzunluğu ${isimler2.length}");
  print(isimler2.isNotEmpty);
  print("------------");

//length 1den başlar
//index 0'dan başlar

  for (int i = 0; i < isimler2.length; i++) {
    print(isimler2[i]);
  }
  // print(isimler.first); burdan sonra izle
*/
