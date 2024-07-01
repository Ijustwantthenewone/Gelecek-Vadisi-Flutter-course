void main() {
  print("Hello");
  cevreYazdir();
  int xq = alanHesapla(2, 3); // alanHesapla() bunun yerine 200 yazıyor
  print(xq);
  print("----");
  int sonuc = hacimHesaplama(10, 55, 10);
  print(sonuc);
}

void cevreYazdir() {
  int uzunKenar = 10;
  int kisaKenar = 20;

  print((kisaKenar + uzunKenar) * 2);
}

int alanHesapla(int en, int boy) {
  // int en = 10;
  // int boy = 20;

  int alan = en * boy;
  print("Alan $alan");
  return alan;
}

// fat arrow (Fat arrow)
int hacimHesaplama(int yukseklik, int genislik, int uzunluk) =>
    yukseklik * genislik * uzunluk; // print'te olur.

int maxOlaniBul(int sayi1, int sayi2) 
  // if (sayi1 > sayi2) {
  //   return sayi1;
  // } else {
  //   return sayi2;
  // }

  => (sayi1 > sayi2) ? sayi1 : sayi2;



// Fonksiyonlar küçük işlere bölmemizi sağlar.
// Tekrarı önler
// veriyi arkada kullanmak için dönüşlü gerek.