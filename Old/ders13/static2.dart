// Dart program in dart to
// illustrate static method
class StaticMem { 
   static late int numes;  
   static disp() { 
      print("#GFG the value of num is ${StaticMem.numes}")  ;  // Basitçe Sınıf adından ulaşabiliyorusun hem fonksiyon hemde değişkenine
   } 
}  
void main() { 
   StaticMem.numes = 75;  
   
   // initialize the static variable } 
   StaticMem.disp();   
   
   // invoke the static method 
}