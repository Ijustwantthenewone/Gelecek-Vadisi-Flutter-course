void main() async {
  print("Program başladı.");

  internettenVeriCek().then((value) {
    print(value);
  }).catchError((a) {
    print(a);
  });
  print("Program bitti");
}

Future<String> internettenVeriCek() async {
  String kullaniciAdi = "Ahmet";
  await Future.delayed(Duration(seconds: 3));
  return Future.error("Kullanıcı bulunamadı");
}
// await bunun işini bitirmesini bekle