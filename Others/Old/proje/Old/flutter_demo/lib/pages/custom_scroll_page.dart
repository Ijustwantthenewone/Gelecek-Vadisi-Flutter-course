import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomScroll extends StatelessWidget {
  const CustomScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          
          const SliverAppBar(
            title: Text("ada"),
            backgroundColor: Colors.red,
            expandedHeight: 200,
            floating: true,
            pinned: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Icon(Icons.abc),
              expandedTitleScale: 3,
            ),
          ),
          SliverGrid(
              delegate: SliverChildListDelegate([]),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9)),
          SliverVisibility(
            sliver: SliverToBoxAdapter(
              child: Text("asd"),
            ),
            visible: true,
          )
        ],
      ),
    );
  }
}
