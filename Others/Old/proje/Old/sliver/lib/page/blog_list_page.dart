import 'package:flutter/material.dart';
import 'package:sliver/page/detail_page.dart';

import '../categoryChip.dart';
import '../model/blog_model.dart';

class BlogListPage extends StatelessWidget {
  BlogListPage({super.key});

  List<BlogModel> itemList = [
    BlogModel(
        imageURL:
            "https://images.unsplash.com/photo-1599844519453-5787a9c9d8a2?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        categoryName: "Hız",
        categroyColor: Colors.purple,
        title: "Otomobiller",
        content:
            "İhbar üzerine bölgeye ekipler sevk edildi. Sağlık ekibi tarafından ilk müdahalesi yapılan polis memuru Yonuz Turan, kaldırıldığı Isparta Şehir Hastanesi’nde müdahaleye rağmen şehit oldu."),
    BlogModel(
        imageURL:
            "https://images.unsplash.com/photo-1584902645120-f86567d892b6?q=80&w=1625&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        categoryName: "Otomobil",
        categroyColor: Colors.red,
        title: "Arabaların gelişimi",
        content:
            "Eğirdir Dağ Komando Okulu’nda görevli askeri personel İ.A. yönetimindeki 17 UY 843 plakalı otomobil, yolda radar uygulaması için hazırlık yapan Isparta Bölge Trafik Müdürlüğü’nde görevli polis memuru Yonuz Turan’a, ardından ekip aracına çarptı.")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return _buildItem(model: itemList[index], context: context);
          },
        ));
  }

  Widget _buildItem({required BlogModel model, required context}) {
    return GestureDetector(
      onTap: () {
        var navi = Navigator.of(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Details(b1: model)));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  model.imageURL,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "asd",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    model.content,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Blog"),
      centerTitle: true,
      leading: const Icon(Icons.menu),
      actions: const [Icon(Icons.search)],
    );
  }
}
