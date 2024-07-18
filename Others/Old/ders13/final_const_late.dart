main() {
  // final int kenar = 10;
  // kenar = 20;
  //final tanımlandıktan sonra değişemez

  //FİNAL ÇALIŞTIRILMA ZAMANINDA SABİT DEĞERLER İLE ÇALIŞIR
  //CONST İSE DERLEME ZAMANINDA SABİT DEĞERLER İLE ÇALIŞIR

  const pi = 3.14; //Daima sabit
  const String name = "Gelecek vadisi";

  late String userName; // sonra atıcam merak etme
  userName = "Ahmet";
  userName.contains("Ahmet");

  User Kullanici = User();
  Kullanici.age = 123;
  print(Kullanici.age);
  
}

class User {
  late String userName;
  late String email;
  late String password;
  late int age;
}
