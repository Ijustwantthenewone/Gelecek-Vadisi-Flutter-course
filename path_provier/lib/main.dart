import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provier/file_service.dart';
import 'package:path_provier/user_model.dart';

//1:01:56 https://drive.google.com/file/d/1FBV-FWG88rJEz2U2bxiyLgNsojGG1yTx/view
//Hocam bu path provider documanın doğru dürüst hiç bir bilgilendirme yok constr çağırma dışında siz nasıl öğrendiniz ? ful sizin söylediklerinize göre yaptım ama sadece anladım
//ezber olmadı ödevi yaptım
void main() {
  runApp(const Page1());
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page2(),
    );
  }
}

class Page2 extends StatelessWidget {
  Page2({super.key});
  User user1 = User.fromJson(
    {
      "userId": 1,
      "id": 1,
      "title":
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body":
          "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  FileService.saveData(user1);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Veriler Kaydedildi")));
                },
                child: const Text("Verileri kaydet")),
            ElevatedButton(
                onPressed: () {
                  FileService.readData(context);
                },
                child: const Text("Verileri Oku")),
            ElevatedButton(
                onPressed: () async {
                  FileService.deleteData(context);
                },
                child: const Text("Verileri sil")),
          ],
        ),
      ),
    );
  }
}
