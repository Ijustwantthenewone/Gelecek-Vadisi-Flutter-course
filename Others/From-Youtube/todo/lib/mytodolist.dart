import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo/add_new_task.dart';
import 'package:todo/colors.dart';
import 'package:todo/header.dart';
import 'package:todo/model/task.dart';
import 'package:todo/service/todo_service.dart';
import 'package:todo/tasktype.dart';
import 'package:todo/todoitem.dart';

class Mytodolist extends StatefulWidget {
  const Mytodolist({super.key});

  @override
  State<Mytodolist> createState() => _MytodolistState();
}

class _MytodolistState extends State<Mytodolist> {
  // List<String> todo = ["Study lessons", "Run 5K", "Go to Party"];
  // List<String> completed = ["Game meetup", "Take out trash"];

  List<Task> todo = [
    Task(
        type: Tasktype.colors,
        title: "Study lessons",
        description: "Study COMP117",
        isCompleted: false),
    Task(
        type: Tasktype.netflix,
        title: "Go to party",
        description: "Attend to party",
        isCompleted: false),
    Task(
        type: Tasktype.netflix,
        title: "Run 5K",
        description: "Run 5 kilometers",
        isCompleted: false),
  ];

  List<Task> Completed = [
    Task(
        type: Tasktype.ticktock,
        title: "Go to party",
        description: "Attend to party",
        isCompleted: false),
    Task(
        type: Tasktype.colors,
        title: "Run 5K",
        description: "Run 5 kilometers",
        isCompleted: false),
  ];

  void addNewTask1(Task nt) {
    setState(() {
      todo.add(nt);
    });
  }

  @override
  Widget build(BuildContext context) {
    TodoService tds = TodoService();

    double deviceHeight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: HexColor(backGroundColor),
      body: Column(
        children: [
          Header(context1: context),
          Expanded(
            flex: 2,
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: FutureBuilder(
                  future: tds.getUnTodos(),
                  builder: (context, snapshot) {
                    print(snapshot.data);
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return TodoItem(
                            task: snapshot.data![index],
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Completed",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: FutureBuilder(
                  future: tds.getCompletedTodos(),
                  builder: (context, snapshot) {
             
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return TodoItem(
                            task: snapshot.data![index],
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )),
            ),
          
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddNewTaskScreen(
                    addnewTask: (merhaba) {
                      addNewTask1(merhaba);
                    },
                  ),
                )); //14.18
              },
              child: const Text("Add New Task"))
        ],
      ),
    );
  }
}
