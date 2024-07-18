class Araba{
  String renk;
  double hiz;
  bool calisiyormu;

  Araba({required this.renk,required this.hiz,required this.calisiyormu});
  //Constructor

  void calistir(){
    calisiyormu = true;
    hiz = 5;
  }
  void durdur(){
    calisiyormu = false;
    hiz = 0;
  }
  void hizlan(int kacKm){
      hiz += kacKm;
  }

  void yavasla(int kacKm){
    hiz -= kacKm;
  }



  void bilgiAl(){
     print("Rengi $renk");
     print("Hız $hiz");
     print("Çalışıyor mu ? $calisiyormu");
  }
}