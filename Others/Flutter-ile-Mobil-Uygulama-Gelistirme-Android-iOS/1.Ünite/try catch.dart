void main() {
  try {
    String boy = "asd";
    String kilo = "80";

    double boydn = double.parse(boy);
    int kilodb = int.parse(kilo);
    double hesaplama = kilodb / (boydn * boydn);
    print(hesaplama);
  } catch (error) {
    print("Hata $error");
  } finally {
    print("Selam");
  }
}

//try dene

//catch hata olursa 

//finally her türlü yapar