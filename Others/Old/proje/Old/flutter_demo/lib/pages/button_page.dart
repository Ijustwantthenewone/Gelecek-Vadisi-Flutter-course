import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Button Page",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  debugPrint("Textbutona basıldı");
                },
                child: Text(
                  "TextButton",
                  style: TextStyle(color: Colors.amber),
                )),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.heart_broken,
                color: Colors.red,
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber)),
              label: Text("TextButton icon"),
            ),
            ElevatedButton(
              onLongPress: () {
                debugPrint("selam");
              },
              onPressed: () {},
              child: Text("ElevelatedButton"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.pinkAccent;
                }
                ;
              })),
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.beach_access),
                label: Text("ElevatedButton icon")),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(),
                    backgroundColor: Colors.deepPurpleAccent),
                onPressed: () {},
                child: Text("asd"))
          ],
        ),
      ),
    );
  }
}
