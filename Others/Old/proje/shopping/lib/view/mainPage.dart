import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/data/data_source.dart';
import 'package:shopping/model/product.dart';
import 'package:shopping/view/details.page.dart';
import 'package:shopping/view/listview_page.dart';
import 'package:shopping/widgets/my_app_bar.dart';

class mainPage extends StatefulWidget { //
  mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 11, left: 11, right: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Women",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const YerindeYenileme(), // SliverGridDelegateWithFixedCrossAxisCount yatayda adeti kadar -- SliverGridDelegateWithMaxCrossAxisExtent genişliğe göre göre kendisi stun veriyor
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(11),
                itemCount: productList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 2 / 3, //itemlerin en boy oranları
                    crossAxisSpacing: 22,
                    mainAxisSpacing: 22,
                    maxCrossAxisExtent: 250),
                itemBuilder: (context, index) {
                  Product pro = productList[index];
                  return _buildProductItem(pro);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(Product pro1) {
    double imageSize = 160;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                p1: pro1,
              ),
            ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: pro1.backgroundColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Image.asset(
                  pro1.image,
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            pro1.title,
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            "\$${pro1.price}",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
