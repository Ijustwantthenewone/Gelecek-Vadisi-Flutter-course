void main() { //polimorfizm
  Araba a1 = Araba();

  Arac ac1 = Arac(); // Bu soyut çok saçma olur
  Arac ac2 = FosilYakitliAraba(); // etrafdaki araclara bak

  Araba a2 = FosilYakitliAraba(); //etraftaki yakıt türüne bak
}

class Arac extends Object {}

class Araba extends Arac {}

class Gemi extends Arac {}

class Tren extends Arac {}

class FosilYakitliAraba extends Araba {}
