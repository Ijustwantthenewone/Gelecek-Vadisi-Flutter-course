void main() {
  Map<String, String> sozluk = {
    "Kalem": "Pencil",
    "Kitap": "Book",
  };

  // sozluk["Kalem"] = "Pencil";
  // sozluk["Kitap"] = "Book";
  // sozluk["Bilgisayar"] = "Computer";

  //Iterable listenin alternatifi

  for (String anahtarlar in sozluk.keys) {
    print(anahtarlar);
  }
  print("XXXXXXX");
  for (String se in sozluk.values) {
    print(se);
  }
  print("XXXXXXX");
  for (MapEntry<String, String> ss in sozluk.entries) {
    print("${ss.key} : ${ss.value}");
  }

  bool kalemVarmi = sozluk.containsKey("Kalem");
  if (kalemVarmi) {
    print("Kalem yanımda");
  } else {
    print("kalemini unutma");
  }

  Map ogrenci = {
    "adı": "furkan", // Entrie anahtar ve değer çifti mapentry dir.
    "soyadı": "yağmur",
    "yas": 20,
    "Mezun mu": false,
  };
}
