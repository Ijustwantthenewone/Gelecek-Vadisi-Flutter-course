void main() {
  String harfnotu = "AB";

  switch (harfnotu) {
    case "AA":
    case "AB":
      print("Sınav notunuz 90 ile 100 arasındadır.");

    case "CB":
      print("S  ınav notunuz 80 ila 90 arasındadır.");

    case "ZZ":
      print("Bu şekilde.");
      break;
    default:
      print("asdasd");
  }
}