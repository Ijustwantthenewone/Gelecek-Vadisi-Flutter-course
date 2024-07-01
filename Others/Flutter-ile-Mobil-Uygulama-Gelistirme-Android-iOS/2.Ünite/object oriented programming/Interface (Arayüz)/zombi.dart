import 'aksiyon.dart';

class Zombi implements Aksiyon {
  @override
  void ol() {
    print("Zombi öldü");
  }

  @override
  void saldir() {
    print("Zombi Saldırdı");
  }

  @override
  void savunma() {
    print("Zombi savunma yaptı");
  }
}
