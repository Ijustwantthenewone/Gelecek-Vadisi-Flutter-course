import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/model/product.dart';
import 'package:shopping/widgets/my_app_bar.dart';
import 'package:shopping/widgets/number_selector.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.p1});

  Product p1;

  @override
  Widget build(BuildContext context) {
    debugPrint(p1.title);
    return Scaffold(
      backgroundColor: p1.backgroundColor,
      appBar: MyAppBar(
        renk: p1.backgroundColor,
      ),
      body: Stack(
        // Sonradan gelen üstte gözüküyor.
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 310), // dış boşluk padding iç boşluk
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          ),
          Padding(
            padding: const EdgeInsets.all(11.0).copyWith(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Aristocratic hand bag",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  p1.title,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTitle(),
                        ],
                      ),
                    ),
                    Image.asset(
                      p1.image,
                      width: 260,
                      height: 260,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          //neden ne yaparsam yapiyim yukarı aşağı oynamıyorlar
                          children: [
                            Text(
                              "Color",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Color(0xFFE47F6B),
                                      radius: 13,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Color(0xFF224588),
                                      radius: 13,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Color(0xFFc62d42),
                                      radius: 13,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Size",
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${p1.size.toString()} cm",
                              style: const TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                      """QuarkXPress to InDesign Converter: Bu, QuarkXPress dosyalarını InDesign dosyalarına dönüştürmek için özel olarak tasarlanmış bir yazılımdır. Ücretsiz ve ücretli sürümleri mevcutturPluginler: QuarkXPress ve InDesign için, dosyaları bir formattan diğerine dönüştürmenizi sağlayan çeşitli eklentilerr."""),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(child: MyNumberSelector()),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(111),
                      ),
                      child: Icon(
                        Icons.favorite,
                        size: 25,
                        color: const Color.fromARGB(255, 216, 16, 16),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.blue, width: 1.4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: SvgPicture.asset(
                          "assets/icons/add_to_cart.svg",
                          width: 33,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              backgroundColor: Color(0xFF3D82AE),
                              fixedSize: Size(1111, 50)),
                          onPressed: () {},
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                                color: Colors.white),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Prive",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Text(
          "\$${p1.price}",
          style: const TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
