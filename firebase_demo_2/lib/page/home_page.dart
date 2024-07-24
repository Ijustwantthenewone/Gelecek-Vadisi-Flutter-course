import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Ana Sayfa"),
            ElevatedButton(
                onPressed: () {}, child: const Text("E-Posta doğrula")),
            ElevatedButton(
                onPressed: () async {
                  CollectionReference users1 =
                      FirebaseFirestore.instance.collection('Evet');
                  var me = await users1.add({"aaaa": "bbbb"});
                  print(me.path);
                },
                child: const Text("Veri ekle")),
            ElevatedButton(
                onPressed: () async {
                  CollectionReference users =
                      FirebaseFirestore.instance.collection('Evet');
                  var snap = await users.get();
                  for (var x in snap.docs) {
                    print(x.data());
                  }
                },
                child: const Text(
                    "Verileri tek seferlik al")), // canlı snapshot // tek sefer get
            ElevatedButton(
                onPressed: () async {
                  var xes = await FirebaseFirestore.instance
                      .collection("Evet")
                      .where("yas", isGreaterThanOrEqualTo: 22)
                      .get();

                  for (var e in xes.docs) {
                    debugPrint(
                        "${e.data()["isim"].toString()} ${e.data()["yas"].toString()}");
                  }
                },
                child: const Text("Where ile filtreleme")),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Evet").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.docs[0].data().toString());
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
