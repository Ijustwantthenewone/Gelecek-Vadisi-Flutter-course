class Database {
  String _userName = "Admin"; //private aynı dosyadaysan erişebilirsin
  String _password = "113131442424";
  String databaseAdress = "192.32.1.1";

  String get usarName {
    //Getirmek için
    return _userName;
  }

  set usarName(String yeniDeger) {
    // eklemek için
    _userName = yeniDeger;
  }
}
 