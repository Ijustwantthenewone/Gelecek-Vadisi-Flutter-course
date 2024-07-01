void main() {
  int? sayi = null;

  if (sayi != null) {
    double sonuc = bol(sayi, 5);
    print(sonuc);
  }
}

double bol(int bolunen, int bolen) {
  return bolunen / bolen;
}




//null hiçlik demek
//? dolu mu boş mu belli değil 
//! null olmadığına eminim















/*
void main() {
  int? sayi = null;

  
    double sonuc = bol(sayi, 5);
    print(sonuc);
  
}

double bol(int? bolunen, int bolen) {
  
  return bolunen / bolen;
}

//null hiçlik
// ? string mi null mı belli değil
// ! null olmadığına eminim
*/