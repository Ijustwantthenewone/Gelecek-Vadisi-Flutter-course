import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class sqFlitePage extends StatefulWidget {
  const sqFlitePage({super.key});

  @override
  State<sqFlitePage> createState() => _sqFlitePageState();
}

class _sqFlitePageState extends State<sqFlitePage> {

  Database? _database;
  final String tableName = "student_table";

  @override
  void initState() {
    super.initState();
    initializeDatabase();
    // WAİT BEKLE
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLflite CRUID operations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  insertData("Ahmet", 34);
                  print("Insert complete");
                },
                child: const Text("Insert")), //ekleme
            ElevatedButton(
                onPressed: () async {
                  var gelenVeri = await readData();
                  for (var xes in gelenVeri) {
                    print(xes); // 5:16
                  }
                },
                child: const Text("Read")),
            ElevatedButton(
                onPressed: () async {
                  int? s = await update(6, "Zeynep");
                  print("Data updated $s");
                },
                child: const Text("Update")),
            ElevatedButton(
                onPressed: () {
                  print("Deleted");
                  delete(2);
                },
                child: const Text("Delete")),
          ],
        ),
      ),
    );
  }

  Future<void> initializeDatabase() async {
    var database = await getDatabasesPath();
    String path = join(database, 'demo.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
         CREATE TABLE $tableName (
          id INTEGER PRIMARY KEY,
          name TEXT,
          age INTEGER
         )
          ''');
      },
    );
  }

  Future<void> insertData(String name, int age) async {
    await _database!.insert(
        tableName,
        {
          "name": name,
          "age": age,
        },
        conflictAlgorithm: ConflictAlgorithm
            .replace); //3 https://www.youtube.com/watch?v=-zcxmqd3PkE&t=343s
  }

  Future<List<Map<String, Object?>>> readData() async {
    return await _database!.query(tableName);
  }

  Future<int?> update(int id, String s) async {
    return await _database!
        .update(tableName, {"name": s}, where: "id = ?", whereArgs: [id]);
  }

  delete(int id) async {
    await _database!.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
  
  
}
