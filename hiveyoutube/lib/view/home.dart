import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hiveyoutube/app_storage.dart';
import 'package:hiveyoutube/model/user.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildFloat(),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text(
          "Hive",
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: buildBody(),
    );
  }

  FloatingActionButton buildFloat() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        int counter = AppStorage.localBox.get("counter") ?? 0;
        counter++;
        AppStorage.localBox.put("counter", counter);
      },
    );
  }

  Widget buildBody() {
    return ValueListenableBuilder(
      valueListenable: AppStorage.localBox.listenable(),
      builder: (context, value, child) {
        int counter = value.get("counter") ?? 0;
        User user1 = value.get("user") ??
            User(email: "ahmetridvanordulu@gmail.com", password: "1United1");
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("User information"),
              Text(user1.email),
              Text(user1.password),
              ElevatedButton(
                  onPressed: () {
                    value.put(
                        "user",
                        User(
                            email: "Selam@outlook.com",
                            password: "123456789"));
                  },
                  child: const Text("Save")),
              Text(counter.toString()),
              TextButton(
                  onPressed: () {
                    AppStorage.localBox.delete("counter");
                  },
                  child: const Text("Sıfırla"))
            ],
          ),
        );
      },
    );
  }
}
