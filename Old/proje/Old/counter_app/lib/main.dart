
import 'package:counter_app/image_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.brown))),
      title: 'Counter App',
      home: ImagePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var sayac = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Butona şu kadar tıkladınız",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "$sayac",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 22),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            sayac += 1;
          });
        },
        child: Icon(Icons.plus_one),
      ),
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: Text("Sayaç uygulaması"),
        centerTitle: true,
      ),
    );
  }
}
