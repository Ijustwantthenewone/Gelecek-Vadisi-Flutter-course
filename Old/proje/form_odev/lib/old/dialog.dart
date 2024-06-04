import 'package:flutter/material.dart';

class dia extends StatelessWidget {
  const dia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          child: const Text("Deneme"),
                          width: 100,
                          height: 100,
                          color: Colors.green,
                        ),
                      );
                    },
                  );
                },
                child: const Text("Show Dialog")),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          TextButton(
                              onPressed: () {}, child: const Text("Merhaba")),
                          TextButton(
                              onPressed: () {}, child: const Text("Çıkış")),
                        ],
                        content: const Text(
                            "Uygulamadan çıkmak istediğinize eminmisiniz"),
                        title: const Text("Uygulamadan çık!"),
                      );
                    },
                  );
                },
                child: const Text("Show Alert Dialog")),
            ElevatedButton(
                onPressed: () async {
                  DateTime? evt = await showDatePicker(
                      context: context,
                      confirmText: "selam",
                      cancelText: "Çık",
                      firstDate: DateTime(2024, 5, 10),
                      lastDate: DateTime(2024, 6, 25));
                  print(evt);
                },
                child: const Text("Show Date Picker")),
            ElevatedButton(
                onPressed: () async {
                  TimeOfDay? asdasd = await showTimePicker(
                      context: context,
                      initialEntryMode: TimePickerEntryMode.dialOnly,
                      initialTime: const TimeOfDay(hour: 2, minute: 42));

                  print(asdasd);
                },
                child: const Text("Show Time Picker")),
          ],
        ),
      ),
    );
  }
}
