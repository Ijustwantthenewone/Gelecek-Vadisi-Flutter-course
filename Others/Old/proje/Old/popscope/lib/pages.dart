import 'package:flutter/material.dart';

class first extends StatelessWidget {
  const first({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text("Birinci sayfa"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "second");
          },
          child: Text("İkinci sayfaya geç"),
        ),
      ),
    );
  }
}

class second extends StatelessWidget {
  const second({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          print(didPop);
          return;
        } else
          return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Çıkış Yap'),
              content: Text('Uygulamadan çıkmak istediğinize emin misiniz?'),
              actions: <Widget>[
                TextButton(
                  child: Text('Evet'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
                TextButton(
                  child: Text('Hayır'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ],
            ),
          );
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
          title: Text("İkinci Sayfa"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  print("Basıldı");
                  Navigator.pop(context);
                },
                child: const Text("Pop"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.maybePop(context);
                },
                child: const Text("maybePop"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
