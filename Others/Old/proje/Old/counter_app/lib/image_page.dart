import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  final String imageUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhERHfLPJivEihBofpV7srogqfhq2SFMFgWA&s";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Page"),
      ),
      body: Center(
        child: IntrinsicHeight(
          // hepsinin yüksekliğini en yükseğe eşitliyor.
          child: Column(
            children: [
              Placeholder(
                fallbackHeight: 100,
                fallbackWidth: 10,
              ),
              FadeInImage.assetNetwork(
                placeholder: "assets/2017-Bugatti-Chiron-016-1600.jpg",
                height: 111,
                alignment: Alignment.center,
                width: 111,
                fit: BoxFit.cover,
                image: "https://i.ytimg.com/vi/LlOLrnJEmaQ/maxresdefault.jpg",
              ),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      width: 200,
                      height: 333,
                      // height: 200,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(imageUrl), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 200,

                      // height: 200,
                      // margin: EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/2017-Bugatti-Chiron-016-1600.jpg"),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          // repeat: ImageRepeat.repeat,
                        ),
                      ),
                    ),
                  ),
                  const Flexible(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage:
                          AssetImage("assets/2017-Bugatti-Chiron-016-1600.jpg"),
                      // backgroundColor: Colors.red,
                      /* child: Text(
                        "FLUTTER",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ), */
                    ),
                  ),

                  /* Image(
                    image: AssetImage("assets/images/car2.jpeg"),
                  ), */
                  /* Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                        image: AssetImage("assets/images/car2.jpeg"),
                      ),
                    ),
                  ), */
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
