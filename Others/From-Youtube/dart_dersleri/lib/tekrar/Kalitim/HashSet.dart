

void main() async{
  var deneme = await sayac();
  print(deneme);
}



Future<String> sayac() async{
  for(var x = 1;x<=6;x++){
    Future.delayed(Duration(seconds: x),() => print(x));
  }
  return Future.delayed(const Duration(seconds: 3),() => "111",);
}