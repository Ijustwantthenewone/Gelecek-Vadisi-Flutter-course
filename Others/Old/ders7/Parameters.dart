void main() {
  // Opsiyonel parametreler []
  // İsimlendirilmiş parametreler {}
  // Zorunlu isimlendirilmiş parametreler {required  sayi1}

  // Aynı anda birlikte denenemezler
  print(daireAlanHesapla(3, pi: 10));
  siparisVer(
    "asd",
    "Mehmet",
    "034983491",
    isTelno: "12312312",
    sayi1: 1,
    sayi2: 3,
  );
}

daireAlanHesapla(int yariCap, {double? pi = 3.14}) {
  return pi! * yariCap * yariCap;
}

siparisVer(String urunAdi, String musteriAdi, String cepTelefonu,
    {required sayi1, required sayi2, String? isTelno, String? isAdresi}) {}
