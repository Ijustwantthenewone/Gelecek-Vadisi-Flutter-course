void main() {
  ornekSinif o1 = ornekSinif();
  o1.b = 111;
  o1.yazdir();
}

class ornekSinif {
  int b = 1;
  yazdir() {
    int b = 2;
    print(this.b);
  }
}

//this sınıf kapsamındaki değere ulaşmak için kullanırız.
// İçerideki kapsamdan dışarıdaki kapsama ulaşabiliriz. 
// ama dışari kapsamdan içerideki kapsama ulaşamayız.
// Kapsam içerisinde tanımlanan değişken kapsam içerisin ede yok olur. 
// Daima içeriden dışarıya bakıyor.