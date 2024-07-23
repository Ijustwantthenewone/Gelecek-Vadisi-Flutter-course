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
                  DocumentReference<Map<String, dynamic>> gelen =
                      FirebaseFirestore.instance
                          .collection("members")
                          .doc("DBsPoeroIFBuKJzOrHcr");
                  DocumentSnapshot<Map<String, dynamic>> snapshot =
                      await gelen.get();
                  if (snapshot.exists) {
                    print(snapshot.data());
                  } else {
                    print("Hata");
                  }
                },
                child: const Text("Verileri tek seferlik al")),
            StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("Evet").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.hasData) {
                    var m = snapshot.data!.docs;
                    
                    return SizedBox(
                      height: 30,
                      width: 30,
                      child: ListView.builder(
                      itemCount: m.length,
                        itemBuilder: (context, index) {
                          return ListTile(title: Text(m[index].id),);
                        },
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}
