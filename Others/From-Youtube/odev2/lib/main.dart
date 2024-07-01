import 'package:flutter/material.dart';
import 'package:odev2/sayfaA.dart';
import 'package:odev2/sayfaB.dart';
void main(){
  runApp(const ana());
}


class ana extends StatelessWidget {
  const ana({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true,),
      home: const anaSayfa(),
    );
  }
}

class anaSayfa extends StatefulWidget {
  const anaSayfa({super.key});

  @override
  State<anaSayfa> createState() => _anaSayfaState();
}

class _anaSayfaState extends State<anaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const sayfaA(),));
            }, child: const Text("Git A")),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const sayfaB(),));
            }, child: const Text("Git B"))
          ],
        ),
      ),
      appBar: AppBar(title: const Text("Anasayfa"),centerTitle: true,backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
    );
  }
}


