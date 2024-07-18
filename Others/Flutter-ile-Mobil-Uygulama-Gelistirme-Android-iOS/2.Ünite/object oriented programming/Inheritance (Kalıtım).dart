//Nesnelerin ortak özellikleri olduğunda kullanılır yazılımcı tasarımcı ikiside öğrenci ama kullandığı programlar farklı
//Kod tekrarı varsa teknik doğru değildir.


class Calisan {
  late String ad;
  late String soyad;
  late int maas;
  late int telefon;
  late String adres;
}

class Yazilimci extends Calisan {
  // Yazilimci Calisanın çocuğu yani onun bütün özelliklerini alır Parent child ilişkisi
  late String yazilimdili;
}

class Pazarlamaci extends Calisan {
  //Pazarlamacı Calısan sınıfının çocuğu yani onun bütün özelliklerini alır Parent child ilişkisi
  late String PazarlamaTeknigi;
}

class Tasarimci extends Calisan {
  // Tasarımcı Calisanın çocuğu yani onun bütün özelliklerini alır Parent child ilişkisi
  late String CizimProgramiAdi;
}

// Basitçe bir sınıfın diğer sınıfın tüm özelliklerini alması

void main() {
  Yazilimci y1 = Yazilimci();
  y1.ad = "Ahmet";
  y1.soyad = "Sönmez";
  y1.maas = 5111;
  y1.telefon = 5417282;
  y1.adres = "Yakuplu";
  y1.yazilimdili = "Python";

  Pazarlamaci p1 = Pazarlamaci();
  p1.ad = "Ahmet";
  p1.soyad = "Sönmez";
  p1.maas = 5111;
  p1.telefon = 5417282;
  p1.adres = "Yakuplu";
  p1.PazarlamaTeknigi = "İkna yöntemi";

  Tasarimci t1 = Tasarimci();
  t1.ad = "Ahmet";
  t1.soyad = "Sönmez";
  t1.maas = 5111;
  t1.telefon = 5417282;
  t1.adres = "Yakuplu";
  t1.CizimProgramiAdi = "Adobe";
}
