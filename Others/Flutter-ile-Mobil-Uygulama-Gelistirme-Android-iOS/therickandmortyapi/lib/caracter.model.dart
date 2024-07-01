class Character1{
  int id;
  String name;
  String status;
  String species;
  String location;
  String image;

  Character1.fromMap(Map<String, dynamic> ulkeMap)
      : id = ulkeMap["id"] ?? 0,
        name = ulkeMap["name"] ?? "",
        status = ulkeMap["status"] ?? "",
        species = ulkeMap["species"] ?? "",
        location = ulkeMap["location"]?["name"] ?? "",
        image = ulkeMap["image"] ?? "";
}
