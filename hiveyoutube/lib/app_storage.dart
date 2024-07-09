import 'package:hive_flutter/adapters.dart';
import 'package:hiveyoutube/model/user.dart';

class AppStorage {
  static Future<void> appStorageInitialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter()); // hive modelin generatorünü tanıtıyoruz.
    await Hive.openBox("kutum");
  }

  static var localBox = Hive.box("kutum");
}
