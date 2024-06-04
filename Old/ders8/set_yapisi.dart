void main() {
  // Iterable Collections'un üst sınıfı sonra değinicekmiş // list set veya map istediğini bil yeter
  // setter içerisinde tekrarlayan veri bulunmaz index tutmuyor yani index ile kullanılan özellikleri kullanamazsın
  Set<String> isimler = Set();

  Set<String> deneme = Set.from(["Fatma", "Mike"]);
  isimler.add("Zeynep");
  isimler.add("Ali");

  isimler.add("Mehmet");
  isimler.add("Zehra");
  isimler.add("Ayşe");
  isimler.add("Mahmut");

  isimler.add("Ali");

  print(isimler);

  if (isimler.contains("Ali")) {
    isimler.remove("Ali");
    print(isimler);
  }
  print("****");

  for (String x in isimler) {
    print(x);
  }
  print(deneme);
}
