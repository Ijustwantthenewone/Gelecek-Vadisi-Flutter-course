import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provier/user_model.dart';

class FileService {
  static saveData(User user1) async {
    Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    String path = "${appDocumentsDir.path}/local_data_file.json";
    File file = File(path);

    await file.writeAsString(
      jsonEncode(
        user1.toJson(),
      ),
    );
  }

  static readData(BuildContext context) async {
    Directory appRead = await getApplicationDocumentsDirectory();
    String path = "${appRead.path}/local_data_file.json";
    File file = File(path);

    if (!file.existsSync()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Dosya mevcut değil"),
        ),
      );
      return;
    }
    String read = await file.readAsString();

    Map<String, dynamic> map = jsonDecode(read);

    User user1 = User.fromJson(map);

    String? ornek = user1.title;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ornek!)));
  }

  static deleteData(BuildContext context) async {
    Directory d1 = await getApplicationDocumentsDirectory();
    String yol = "${d1.path}/local_data_file.json";
    File file = File(yol);

    if (file.existsSync()) {
      file.delete();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Silindi")));
    }
  }
}
