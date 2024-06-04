void main() {
  MyStack<int> sayilar = MyStack();
  sayilar.push(13);
  sayilar.push(55);
  var silinen = sayilar.pop();
  // sayilar.push("Ahmet");
  // sayilar.push(false);
  sayilar.push(13);
  sayilar.yazdir();
}

class MyStack<S> {
  // MyStack<S> generic yapıyor
  List<S> listem = [];

  push(S yeniVeri) {
    listem.add(yeniVeri);
  }

  S pop() {
    return listem.removeLast();
  }

  yazdir() {
    print(listem);
  }
}
