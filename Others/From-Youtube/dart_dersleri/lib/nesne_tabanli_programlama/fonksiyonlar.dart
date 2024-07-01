class Fonksiyonlar{
  // void geri dönüşü yok
  void merhaba(){
    String ornek = "Merhaba hira";
    print(ornek);
  }

  //return veri geri döndürür
   isim(){
    String isim = "Ahmet";
    return isim;
  }

   void selamla3(String isim){
      String evet = "Merhaba $isim";
      print(evet);
   }

   int toplam(int sayi1,int sayi2){
      int toplam = sayi1 + sayi2;
      print(toplam);
      return toplam;
   }
}