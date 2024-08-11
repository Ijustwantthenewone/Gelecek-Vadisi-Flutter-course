import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider<int> provider1 = Provider(
//   (ref) => 3,
// );

// StateProvider<int> provider1 = StateProvider( değiştirilebilir
//   (ref) => 3,
// );

FutureProvider<int> provider1 = FutureProvider(
  //  Future için
  (ref) async {
    await Future.delayed(const Duration(seconds: 4));
    return 12;
  },
);

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var result = ref.read(provider1);

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // var result =
              //     ref.read(provider1.notifier); // yazarkende read kullanıyoruz
              // result.state++;
              // print(result.state);
            },
          ),
          appBar: AppBar(
            title: const Text("RiverPOD"),
            backgroundColor: Colors.green,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(ref.watch(provider1).toString())],
            ),
          ),
        );
      },
    );
  }
}

//Provider
//StateProvider eyer artırma olacaksa bu

//read bir defa okur
//watch hep izler ve hep değişir
