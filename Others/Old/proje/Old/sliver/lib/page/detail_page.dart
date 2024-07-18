import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliver/model/blog_model.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.b1});

  BlogModel b1;

  String text =
      "Karabük'te,Filyos Çayı'nda cesedi bulunan Gabonlu üniverFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) ösite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) öFilyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) ö Filyos Çayı'nda cesedi bulunan Gabonlu üniversite öğrencisi Jeannah Danys Dinabongho Ibouanga'nın (17) ölümüne ilişkin Dursun Acar’ın tutuklu yargılandığı davanın 3’üncü duruşmasında, Gabon Büyükelçisi Bernard Avouma da yer aldı. Duruşmada, Baba Guy Serge Ibouanga, “Ben kızımı okumaya gönderdim ama tabut içinde geri aldım” dedi. Dursun Acar’ın tutukluluk halinin devamına karar verilirken, Dina'nın son görüldüğü apartmanda keşif yapılması talebi ise reddedildi.";

  @override
  Widget build(BuildContext context) {
    // """ html anlamına geliyor
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          b1.title,
                          style: TextStyle(
                              fontSize: 22, backgroundColor: Colors.yellow),
                        ),
                        Text(
                          "Bir yazılımcının yol haritası",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(b1.imageURL), fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("""sd"""),
            ),
          )
        ],
      ),
    );
  }
}
