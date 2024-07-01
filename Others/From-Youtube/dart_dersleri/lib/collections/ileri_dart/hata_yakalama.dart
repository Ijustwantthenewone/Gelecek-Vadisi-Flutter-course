void main(){
  var liste = <String>[];
  liste.add("Ürünler");
  liste.add("Kategoriler");

  try{
    var St1 = liste[1];
    print(St1);
  }catch(exes){
    print("Sınırı aştınız");
  }
}