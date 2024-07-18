void main() {
  int not = 11;

  if (not == 5) {
    print("Harika");
  } else if (not == 4) {
    print("İyi");
  } else if (not == 3) {
    print("Orta");
  } else if (not == 2) {
    print("Çok kötü");
  } else {
    print("Berbat");
  }

  switch (not) {
    case 5:
      print("Harika");
    case 4:
      print("İyi");
    case 3:
      print("Orta");
    case 2:
      print("Çok kötü");
    case 1:
      print("Berbat");
    default:
      print("Geçersiz");
  }
}











































/*
void main() {
  int not = 1;

  switch (not) {
    case 50:
      print("Çok kötü");
    case 40:
      print("İyi");
    case 30:
      print("Berbat");
    default:
      print("Çok çok kötü");
  }
}
//switch case sadece == için kullanılır
*/