import 'aksiyon.dart';

class Ejderha implements Aksiyon {
  @override
  void ol() {
    print("Ejderha öldü");
  }

  @override
  void saldir() {
    print("Ejderha Saldırdı");
  }

  @override
  void savunma() {
    print("Ejderha savunma yaptı");
  }
}
