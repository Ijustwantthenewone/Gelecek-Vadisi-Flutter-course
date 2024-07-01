void main() {
  gelsin();
}

void gelsin() async {
  await Future.delayed(
    Duration(seconds: 4),
    () {
      print("Selam şeker");
    },
  ).then((value) {
    print("Future işlemi başarıyla tamamlandı.");
  }).catchError((err) {
    print(err);
  }).whenComplete(() => print("Tamam"));
}
/*
await Future.delayed(Duration(seconds: 2), () {
    print("Çorba pişiriliyor.");
    // throw "Çorba yandı!";
    print("Çorba tabağa konuluyor.");
    print("Çorba servise hazır.");
  }).then((value) {
    print("Future işlemi başarıyla tamamlandı.");
  }).catchError((error) {
    print("Future işleminde hata alındı! $error");
  }).whenComplete(() => print("Future sonlandı."));
  print("Program bitti.");
*/