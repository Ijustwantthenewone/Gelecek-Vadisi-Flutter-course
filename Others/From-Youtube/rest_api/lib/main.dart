import 'package:flutter/material.dart';
import 'package:rest_api/post_screen.dart';
import 'package:rest_api/utils/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    APIService s1 = APIService();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: s1.getComments(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(snapshot.data![index].email.toString());
                    },
                    itemCount: snapshot.data!.length,
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostScreen(),
                                ));
                          },
                          child: const Text(
                            "Send data",
                            style: TextStyle(color: Colors.white),
                          )))
                ]);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const CircularProgressIndicator(
                strokeWidth: 7,
              );
            },
          ),
        ),
      ),
    );
  }
}
