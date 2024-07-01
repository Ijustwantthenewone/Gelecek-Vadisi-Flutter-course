class odev1 {
  int otoparkUcretiHesaplama(int girilenSaat){
    int toplamUcret = 50 * girilenSaat;
    int birsaatuzerindekiUcret = girilenSaat > 1 ? (girilenSaat - 1) * 10 : 0 * 10;

    return toplamUcret + birsaatuzerindekiUcret;

  }
}








































//double calculateSalary(int daysWorked) {
//     // Çalışılan toplam saat sayısını hesapla.
//     int totalHoursWorked = daysWorked * 8;
//
//     // Fazla mesai yapılan saat sayısını hesapla.
//     int overtimeHoursWorked = totalHoursWorked > 150 ? totalHoursWorked - 150 : 0;
//
//     // Toplam maaşı hesapla.
//     double totalSalary = totalHoursWorked * 40 + overtimeHoursWorked * 80;
//
//     // Toplam maaşı döndür.
//     return totalSalary;
//   }