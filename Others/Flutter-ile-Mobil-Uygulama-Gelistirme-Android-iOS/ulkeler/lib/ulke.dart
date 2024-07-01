import 'dart:isolate';

class Ulke {
  String ulkeKodu;
  String isim;
  String baskent;
  String bolge;
  int nufus;
  String bayrak;
  String dil;

  //isimlendirilmiş Constructor
  Ulke.fromMap(Map<String, dynamic> ulkeMap)
      : ulkeKodu =
            ulkeMap["cca2"] ?? "", //       ?? soldaki null ise sağdakini ata
        isim = ulkeMap["name"]?["common"] ?? "",
        baskent =(ulkeMap["capital"] as List<dynamic>).isNotEmpty ? ulkeMap["capital"][0] : "",
        bolge = ulkeMap["region"] ?? "",
        nufus = ulkeMap["population"] ?? 0,
        bayrak = ulkeMap["flags"]?["png"] ?? "",
        dil = (ulkeMap["languages"] as Map<String, dynamic>).isNotEmpty ?
        (ulkeMap["languages"] as Map<String, dynamic>)
                .entries
                .toList()[0] // 9 :08
                .value :
            ""; //entries bir maptaki tüm key ve valueleri alır ve istediğin gibi kullanırsın
}









/*

[
  {
    "flags": {
      "png": "https://flagcdn.com/w320/de.png",
      "svg": "https://flagcdn.com/de.svg",
      "alt": "The flag of Germany is composed of three equal horizontal bands of black, red and gold."
    },
    "name": {
      "common": "Germany",
      "official": "Federal Republic of Germany",
      "nativeName": {
        "deu": {
          "official": "Bundesrepublik Deutschland",
          "common": "Deutschland"
        }
      }
    },
    "cca2": "DE",
    "capital": [
      "Berlin"
    ],
    "region": "Europe",
    "languages": {
      "deu": "German"
    },
    "population": 83240525
  }
]

*/
