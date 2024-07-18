import 'package:customscrollview/model/cars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Detay extends StatelessWidget {
  Detay({required this.ces, required BuildContext context});

  Cars ces;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(ces.imgURL), fit: BoxFit.cover)),
                child: SafeArea(
                  child: Stack(children: [
                    Center(
                        child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(112),
                      ),
                      child: Text(
                        ces.title,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    )),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    )
                  ]),
                ),
              ),
            ),
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              child: Column(
                children: [
                  Text(
                    ces.content,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )
                ],
              ),
              padding: EdgeInsets.all(30),
            ),
          )
        ],
      ),
    );
  }
}
