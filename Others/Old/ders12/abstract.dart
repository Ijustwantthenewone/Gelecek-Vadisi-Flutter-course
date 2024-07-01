void main() {
  Araba a1 = Ucak();
}

abstract class Araba extends Object { // Abstract sınıflardan nesne oluşturulamaz.  İçerisine soyut fonksiyonlar yzaılabilir.
  calistir(); //Bunları barındırmak zorunda
  dur(); // Bunlar soyut fonksiyonlar
  yavasla();
}

class Ucak extends Araba {
  @override
  calistir() {
    print("Çalıştır.");
  }

  @override
  dur() {
    print("Tren çalıştırıldı.");
  }

  @override
  yavasla() {
    print("Tren çalıştırdı.");
  }
}
