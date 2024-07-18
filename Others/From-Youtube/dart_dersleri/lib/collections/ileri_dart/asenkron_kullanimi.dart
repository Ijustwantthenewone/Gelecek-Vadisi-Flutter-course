Future<void> main() async{
  print("Bekleniyor");
  var s1 = await gelenVeri();
  print(s1);
}

Future<String> gelenVeri() async {
  for (var i = 1; i < 5; i++) {
    Future.delayed(
      Duration(seconds: i),
      () {
        print("${i * 20}");
      },
    );
  }
  return Future.delayed(const Duration(seconds: 3),() => "Selam",);
}
