mixin Ucma {
  // Sadece özellikten yararlanmak için yine istenirse kalıtım kullanılabilir(extends) , mixinlerden nesne türetilemez, Constructor yapılamaz.
  late int ucusHizi;
  late int ucmaSuresi;

  void ucusHiziniYazdir() {
    print("Uçuş hızı : $ucusHizi");
  }

  void ucmaSuresiniYazdir() {
    print("Uçma süresi $ucmaSuresi");
  }
}
