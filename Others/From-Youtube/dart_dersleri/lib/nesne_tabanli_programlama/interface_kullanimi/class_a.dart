import 'package:dart_dersleri/nesne_tabanli_programlama/interface_kullanimi/myinterface.dart';

class ClassA implements myinterface{
  @override
  int? degisken = 15;

  @override
  void metod() {
    print("metod 1 çalıştı");
    // TODO: implement metod
  }

  @override
  String metod2() {
    return "Metod2 Çalıştı";  
    throw UnimplementedError();
  }

}