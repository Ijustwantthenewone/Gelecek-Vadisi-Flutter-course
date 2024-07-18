main() {
  print("Program başladı");
  Future.delayed(
    Duration(seconds: 3),
    () {
      print("Çorba hazırlandı");
      throw "Çorba yandı";
    },
  ).then((value) {
    print("Future işlemi tamamlandı");
  }).catchError((err) {
    print(err);
  }).whenComplete(() => print("bitti"));
  print("program bitti.");
}

VeriOku() async {
  await veritabaninaBaglan();
  print("Future Tamamlandı");
}

veritabaninaBaglan() async {
  
}
