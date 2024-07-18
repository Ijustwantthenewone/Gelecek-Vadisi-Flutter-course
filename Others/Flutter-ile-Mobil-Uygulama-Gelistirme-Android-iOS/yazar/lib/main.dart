import 'package:flutter/material.dart';
import 'package:yazar/view/kitaplar_sayfasi.dart';
import 'package:yazar/yerel_veri_tabani.dart';

void main() { //Bu işlemler karmaşık gelebilir ki öyle ama ezberleye çalışmayın mantığını anlayın. sadece anla geç uygulaması
  runApp(const AnaUygulama()); //5:49
}

class AnaUygulama extends StatelessWidget {
  const AnaUygulama({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KitaplarSayfasi(),
    );
  }
}