void main() {
  print(topla(3, 1));
  print(topla(1, 8, 6));
  print(topla(11, 333, 2, 2));
}

topla(int sayi1, int sayi2, [int sayi3 = 3, int sayi4 = 3]) {
  return sayi1 + sayi2;
}
// İsimlendirilmiş parametrelerin isimsiz hali []