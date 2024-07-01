void main() {
  String? isim = "Mehmet";

  String? kullaniciAdi;
  kullaniciAdi = "Samet";
  print("Merhaba ${kullaniciAdi ?? "eee"}");

  kullaniciAdi ??= "Ahmet";
  print(kullaniciAdi);

  String? telNo = null;
  String? evTelNo = "42413123";
  String? isTelNo = "+123235884";

  String aranacakTelefon = telNo ?? evTelNo ?? isTelNo ?? "Telefon numarası bulunamadı";
  print(aranacakTelefon);
}


// ?? null ise

//52:14