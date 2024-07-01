void main() {
  try { //dene
    int sayi = 4 ~/ 0;
  } catch (hata) { // hata olursa yap
    print(hata);
  } finally { //ne olursa olsun çalışır
    
    print("Try - Catch tamamlandı!");
  }

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

//   try {
//     int age = 17;
//     if (age < 18) {
//       throw AgeException(message: "Hata", currentAge: age, supportedAge: 18);
//     } else {
//       print("Uygulamaya giriş yapılıyor.");
//     }
//   }on AgeException{
    
//   }
//    catch (d) {
//     print(d);
//   }
// }

// class AgeException implements Exception { // racon böyle imiş :)
//   String message;
//   int currentAge;
//   int supportedAge;
//   AgeException(
//       {required this.message,
//       required this.currentAge,
//       required this.supportedAge});
 }
