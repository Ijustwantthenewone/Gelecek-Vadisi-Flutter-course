void main() {
  print(topla(11, 33, 4));
  print(topla(1, 44, 23, 44));
}

int topla(int sayi1, int sayi2, [int? sayi3 = 0, int? sayi4 = 0]) { //default value öneriliyor.
  return sayi1 + sayi2 + sayi3! + sayi4!;
}


//opsiyonel parametre [int? sayi3, int? sayi4]


/*
void main() {
  print(topla(11, 33, 4));
  topla(1, 44, 23, 44);
}

int topla(int sayi1, int sayi2, [int? sayi3, int? sayi4]) {
  return sayi1 + sayi2 + (sayi3 ?? 0) + (sayi4 ?? 0);
}
//opsiyonel parametre [int? sayi3, int? sayi4]
*/