import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo/Extanded.dart';
import 'package:todo/colors.dart';
import 'package:todo/gesturedetector.dart';
import 'package:todo/model/task.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/service/todo_service.dart';
import 'package:todo/tasktype.dart';

class AddNewTaskScreen extends StatefulWidget {
  AddNewTaskScreen({super.key, required this.addnewTask});
  Function(Task merhaba) addnewTask; // Task

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titlecont = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController timecont = TextEditingController();
  TextEditingController descriptioncont = TextEditingController();
  TodoService todoService = TodoService();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HexColor(backGroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: deviceHeight / 7,
              width: devicewidth / 1,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/pexels-pixabay-45206.jpg"),
              )),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: devicewidth / 11,
                      )),
                  const Expanded(
                    child: Text(
                      "Add new Task",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: deviceHeight / 100),
              child: const Text(
                "Task title",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextField(
                controller: titlecont,
                decoration:
                    InputDecoration(filled: true, fillColor: Colors.amber[50]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Category"),
                ges(
                  message: "Netflix selected",
                  assetim: "assets/images/1.png",
                  ts: Tasktype.netflix,
                ),
                ges(
                  message: "Tictoc selected",
                  assetim: "assets/images/2.png",
                  ts: Tasktype.ticktock,
                ),
                ges(
                  message: "Glasses selected",
                  assetim: "assets/images/3.png",
                  ts: Tasktype.colors,
                ),
                //asdasdasda
              ],
            ),
            SizedBox(
              height: deviceHeight / 30,
            ),
            Row(
              children: [
                Extanded1(
                  yazi: "User ID",
                  cont: userIdController,
                ),
                Extanded2(
                  yazi: "Time",
                  cont2: timecont,
                )
              ],
            ),
            const Text("Description"),
            Padding(
              padding: EdgeInsets.only(top: deviceHeight / 60),
              child: SizedBox(
                height: deviceHeight / 4,
                child: TextField(
                  controller: descriptioncont,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                      filled: true, fillColor: Colors.amber[50], isDense: true),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  saveTodo();
                  Navigator.of(context).pop();
                },
                child: Text("Save")),
          ],
        ),
      ),
    );
  }

  void saveTodo() {
    Todo _t = Todo(
        id: -1,
        todo: titlecont.text,
        completed: false,
        userId: int.parse(userIdController.text));

    todoService.addTodo(_t);
  }
}
