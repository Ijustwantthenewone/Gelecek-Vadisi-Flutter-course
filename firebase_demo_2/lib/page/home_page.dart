import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;

    user.updateDisplayName("Furkan Yağmur").then(
      (value) {
        debugPrint("user.email : ${user.email}");
        debugPrint("user.displayName : ${user.displayName}");
        debugPrint("user.uid : ${user.uid}");
        debugPrint("user.phoneNumber : ${user.phoneNumber}");
        debugPrint("user.emailVerified : ${user.emailVerified}");
      },
    );

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
                onPressed: () {
                  user.sendEmailVerification();
                },
                child: const Text("E-Posta doğrula")),
            ElevatedButton(
                onPressed: () async {
                  CollectionReference users1 =
                      FirebaseFirestore.instance.collection('users');
                  var me = await users1.add({"Deneme1": "Deneme2"});
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
                  }
                },
                child: const Text("Verileri tek seferlik al")),
          ],
        ),
      ),
    );
  }
}
