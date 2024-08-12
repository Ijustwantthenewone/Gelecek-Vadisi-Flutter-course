import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Page1 extends ConsumerWidget {
  Page1({super.key});

  var exampleProvider = StateProvider<int>( 
    (ref) {
      return 2;
    },
  );

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.watch(exampleProvider).toString()),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(exampleProvider.notifier).state++;
                },
                child: const Text("+")),
            ElevatedButton(
                onPressed: () {
                  ref.read(exampleProvider.notifier).state--;
                },
                child: const Text("-"))
          ],
        ),
      ),
    );
  }
}

//Read only edit dont listen
//Watch listen to changes
