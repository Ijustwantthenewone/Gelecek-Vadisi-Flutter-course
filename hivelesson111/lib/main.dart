import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hivelesson/model/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // runApp'den önce işlem yapıcaksak bu bir kalıp
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());

  runApp(const asa());
}

class asa extends StatelessWidget {
  const asa({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  Box<dynamic> b1 = await Hive.openBox("Users");

                  await b1
                      .putAll({"Lastname": "Yağmur", "School": "High School"});

                  await b1.clear();

                  for (var key in b1.keys) {
                    print("$key ${b1.get(key)}");
                  }
                },
                child: const Text("Ekle")),
            ElevatedButton(
                onPressed: () async {
                  Box<UserModel> studentBox =
                      await Hive.openBox<UserModel>("student");
                  await studentBox.add(UserModel(
                      name: "Ahmet",
                      lastName: "Sözmez",
                      gno: 3.13,
                      mezunMu: false));
                  print(studentBox.toMap().toString());
                },
                child: const Text("User ekle"))
          ],
        ),
      ),
    );
  }
}
