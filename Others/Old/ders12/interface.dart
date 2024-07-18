abstract class Hayvan {
  beslen();
  hareketEt();
  sesCikar();
}

class Yuruyebilenler {
  yuru() {}

  yorul() {}

  dinlen() {}
}

class dortayaklilar {
  List listem = [];
}

class Kopek extends Hayvan 
    implements //Heri iki sınıfın özelliklerine sahip olmaya yarıyor
        Yuruyebilenler,
        dortayaklilar {
          @override
          late List listem;
        
          @override
          beslen() {
            // TODO: implement beslen
            throw UnimplementedError();
          }
        
          @override
          dinlen() {
            // TODO: implement dinlen
            throw UnimplementedError();
          }
        
          @override
          hareketEt() {
            // TODO: implement hareketEt
            throw UnimplementedError();
          }
        
          @override
          sesCikar() {
            // TODO: implement sesCikar
            throw UnimplementedError();
          }
        
          @override
          yorul() {
            // TODO: implement yorul
            throw UnimplementedError();
          }
        
          @override
          yuru() {
            // TODO: implement yuru
            throw UnimplementedError();
          }
        } 

class Kedi extends Hayvan {
  @override
  beslen() {
    // TODO: implement beslen
    throw UnimplementedError();
  }

  @override
  hareketEt() {
    // TODO: implement hareketEt
    throw UnimplementedError();
  }

  @override
  sesCikar() {
    // TODO: implement sesCikar
    throw UnimplementedError();
  }
}

class Kus extends Hayvan {
  @override
  beslen() {
    // TODO: implement beslen
    throw UnimplementedError();
  }

  @override
  hareketEt() {
    // TODO: implement hareketEt
    throw UnimplementedError();
  }

  @override
  sesCikar() {
    // TODO: implement sesCikar
    throw UnimplementedError();
  }
}
