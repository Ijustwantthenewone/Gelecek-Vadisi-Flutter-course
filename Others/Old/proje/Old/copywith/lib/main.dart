import 'package:flutter/material.dart';

class Kisi {
  final String isim;
  final int yas;

  Kisi({required this.isim, required this.yas});

  Kisi copywith(
    int yas,
  ) {
    return Kisi(isim: "Mehmet", yas: yas);
  }
}

void main() {
  Kisi k1 = Kisi(isim: "Ahmet", yas: 13);
  Kisi k2 = k1.copywith(12);
  print(k2.isim);
}

/*

Kisi copyWith({
    required String isim,
    required int yas,
  }) {
    return Kisi(
      isim: isim ?? this.isim,
      yas: yas ?? this.yas,
    );
  }

*/