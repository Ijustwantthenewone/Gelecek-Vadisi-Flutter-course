void main() {
  int yas = 9;
  String isim = "ads";

  if (yas >= 19) {
    print("Reşitsiniz");
  } else {
    print("Reşit değilsiniz");
  }

  if (isim == "Mehmet") {
    print("Hoşgeldiniz efendim");
  } else if (isim == "Ayşe") {
    print("Hoşgeldiniz Ayşe hanım");
  } else {
    print("Tanınmıyorsunuz.");
  }

  String kullanici = "Admin";
  int sifresi = 131313;

  if(kullanici == "Admin" && sifresi == 13131){
    print("Giriş yapıldı.");
  }else{
    print("Hatalı giriş, şifrenizi mi unuttunuz.");
  }


  int a = 151;

  if(a == 15 || a == 16){
    print("Sayi 15 veya 16 dır");
  }else{
    print("Kapsam dahilinde değil");
  }

}
