void main() {

  List<String> calisanlar = ["Ali", "Ayşe", "Fatma", "Ahmet"];
  List<int> maaslar = [9000, 5000, 12000, 7000];

  Map<String , bool> calisanMaaslari = {
    "Ali": true,
    "Ayşe": false,
    "Fatma": true,
    "Ahmet": false,
  };
  
  print(maaslar[3]);
  print(calisanMaaslari["Fatma"]);

  //map = key => value
  //index kaç tane eleman olduğunu gösterir
}





























//İndex kaçıncı olduğunu söyler

/*


  int index = calisanlar.indexOf("Ahmet");
  print(index);
  print(maaslar[index]);
    List<String> calisanlar = ["Ali", "Ayşe", "Fatma", "Ahmet"];
  List<int> maaslar = [3000, 5500, 4000, 9000];

  Map<String, bool> calisanmaaslari = {
    "Ali": 9000,
    //key => value
    "Ayşe": 5000,
    "Fatma": 12000,
    "Ahmet": 7000,
  };

  print(calisanmaaslari["Fatma"]);
*/