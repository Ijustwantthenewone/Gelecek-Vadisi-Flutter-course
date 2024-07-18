void main() async {
  print("Program başladı.");

  await internettenVeriCek().then((String selesler) {
    print(selesler);
  });

  print("Program bitti.");
}

Future<String> internettenVeriCek() async {
  String kullaniciAdi = "Ahmet";
  await Future.delayed(Duration(seconds: 3));
  return Future.value(kullaniciAdi);
}

// Belirli bir süre sonra gelen verilere future denir