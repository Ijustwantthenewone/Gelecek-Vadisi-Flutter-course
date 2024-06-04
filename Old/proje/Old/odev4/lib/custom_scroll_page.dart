import 'dart:math';

import 'package:flutter/material.dart';

class customScrollPage extends StatelessWidget {
  const customScrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    String icerik =
        "Maecenas efficitur at magna a cursus. Donec tincidunt, urna ut egestas laoreet, nunc enim scelerisque massa, at dignissim neque sem a turpis. Nulla facilisi. Vivamus pharetra ac tortor sit amet aliquam. Mauris quis venenatis erat. Vivamus sed nisi sed sem fermentum rutrum vitae at eros. Nam bibendum malesuada dapibus. Proin semper id neque sit amet tincidunt. Quisque sodales, odio quis viverra tristique, leo tellus placerat lacus, et luctus diam est eu dolor. In scelerisque, erat eget posuere suscipit, quam tortor laoreet nunc, vel feugiat justo neque viverra leo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse non laoreet ligula, in facilisis sapien. Donec molestie augue risus, in mollis magna faucibus a. Quisque consequat tempus risus in maximus. Sed sed arcu dapibus, porttitor elit lacinia, cursus dui. Nunc efficitur, libero quis commodo placerat, eros turpis mollis mi, id lacinia mi quam sed lacus. Pellentesque a dui non augue suscipit facilisis nec nec enim. Fusce quis mattis dui, sed bibendum augue. Nunc feugiat diam erat, et sodales risus porttitor sed. Proin non lectus sit amet orci ullamcorper scelerisque. Vivamus varius tellus at enim sagittis tincidunt. Duis tincidunt tortor et consectetur congue. Proin in ligula ut est volutpat consectetur. Aliquam vel neque id sapien pellentesque sagittis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur tincidunt tortor nec nunc gravida ultrices. Pellentesque non varius velit. Cras at mauris lorem. Proin sed facilisis tortor. Morbi nec convallis metus, id congue elit. Morbi scelerisque lacus ut dictum scelerisque. Proin pulvinar dolor vel molestie gravida. Morbi ac gravida leo, non eleifend enim. Nullam luctus dictum odio, sed tristique arcu feugiat sed. Morbi vestibulum sed mauris a fermentum. Ut vel risus quis justo efficitur mollis. Maecenas id eros blandit, consectetur odio a, tristique augue. Vestibulum diam nisi, dignissim in hendrerit in, aliquam fermentum sem. Sed convallis suscipit mi, nec varius risus laoreet at. Curabitur suscipit lacinia libero ac rhoncus. Cras id risus arcu. Fusce aliquet sem sit amet lorem vehicula, nec dignissim quam volutpat. Phasellus maximus et augue eu fringilla. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?";

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            floating: true,
            centerTitle: true,
            
            snap: true,
            leading: Icon(
              Icons.arrow_back,
              size: 30,
            ),
            backgroundColor: Colors.orange,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://images.pexels.com/photos/2570718/pexels-photo-2570718.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(icerik),
                  ),
                  color: Colors.white,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
