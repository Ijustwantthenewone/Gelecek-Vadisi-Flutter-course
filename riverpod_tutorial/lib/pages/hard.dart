import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/models/student.dart';

class Page2 extends ConsumerWidget {
  Page2({super.key});

  final modelRiverPod = ChangeNotifierProvider<Student>(
    (ref) {
      return Student(counter: 0);
    },
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.watch(modelRiverPod).counter.toString()),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(modelRiverPod).addC();
                },
                child: const Text("+")),
            ElevatedButton(
                onPressed: () {
                  ref.read(modelRiverPod).removeC();
                },
                child: const Text("-")),
            ElevatedButton(
                onPressed: () {
                  ref.read(modelRiverPod).changeTheValue(3);
                },
                child: const Text("-"))
          ],
        ),
      ),
    );
  }
}
