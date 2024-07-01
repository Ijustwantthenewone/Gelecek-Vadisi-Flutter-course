import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../model/user_model.dart';

class ListViewPage extends StatelessWidget {
  List<UserModel> userList = [
    UserModel(name: "Furkan", phone: "+51837138"),
    UserModel(name: "Ahmet", phone: "+541683481"),
    UserModel(name: "Mehmet", phone: "+852349821"),
    UserModel(name: "asd", phone: "+2456345784568"),
    UserModel(name: "dfgh", phone: "+2131352"),
    UserModel(name: "zxcv", phone: "+679678"),
    UserModel(name: "ıoş", phone: "+35468"),
    UserModel(name: "öhk", phone: "+54168334481"),
    UserModel(name: "vbnm", phone: "+546785478"),
    UserModel(name: "qewra", phone: "+112312"),
    UserModel(name: "zxcsdfa", phone: "+5416834481"),
    UserModel(name: "qayudf", phone: "+852349821"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ListView kullanımları"),
        ),
        body: _buildItem(name: 'Ahmet',context: context,phone: "qasdasd",sayi: 123));
  }

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  Widget selam() {
    return Column(
      children: [
       
        Expanded(
          child: Container(
            color: Colors.grey,
            child: ListView(
              shrinkWrap: true, // içerik kadar içerik kadar kullanıyor
              children: [
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.red,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.orangeAccent,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.pink,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.black,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.green,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.red,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.amber,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.orangeAccent,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.pink,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.black,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.red,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.amber,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.orangeAccent,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.pink,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.black,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.red,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.amber,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.orangeAccent,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.pink,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.black,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.amber,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.orangeAccent,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.pink,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.black,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.amber,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.orangeAccent,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.pink,
                ),
                Container(
                  width: 11,
                  height: 34,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(onPressed: () {}, child: Text("asdasd"))
      ],
    );
  }

  ListTile _buildItem(
      {required String name,
      required String phone,
      required int sayi,
      required BuildContext context}) {
    return ListTile(
      style: ListTileStyle.list,
      // tileColor: sayi % 2 == 0 ? Colors.red : Colors.blue,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text("asd"),
              title: const Text("sadasd"),
              actions: [
                TextButton(onPressed: () {}, child: const Text("asd")),
                TextButton(onPressed: () {}, child: const Text("asd")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.amber),
                    onPressed: () {},
                    child: const Text("asd"))
              ],
            );
          },
        );
      },
      onLongPress: () {
        
      },
      title: Text(name),
      trailing: Text(phone),
      subtitle: const Text("Öncelik"),
      leading: CircleAvatar(
        backgroundImage: const NetworkImage(// asdasd
            "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg"),
        child: Text(name.characters.first),
      ),
    );
  }

  _evet(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Kişi aranıyor"),
      backgroundColor: Colors.blue,
      action: SnackBarAction(
        label: "Tamam",
        onPressed: () {},
      ),
      dismissDirection: DismissDirection.endToStart,
      duration: const Duration(seconds: 3),
    ));
  }
}
