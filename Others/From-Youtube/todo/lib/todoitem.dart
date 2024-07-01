import 'package:flutter/material.dart';

import 'package:todo/model/todo.dart';
import 'package:todo/tasktype.dart';

class TodoItem extends StatefulWidget {
  TodoItem({super.key, required this.task});
  final Todo task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.completed! == true ? Colors.redAccent : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /*  FİREBASE 
            widget.task.type == Tasktype.colors
                ? Image.asset(
                    "assets/images/3.png",
                    width: 50,
                  )
                : widget.task.type == Tasktype.netflix
                    ? Image.asset(
                        "assets/images/1.png",
                        width: 50,
                      )
                    : Image.asset(
                        "assets/images/2.png",
                        width: 50,
                      ),*/
                      Image.asset(
                    "assets/images/1.png",
                    width: 50,
                  ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task
                        .todo!, // sınıfdaki değişkeni alabilmek için widget
                    style: TextStyle(
                        decoration: widget.task.completed == true
                            ? TextDecoration.lineThrough
                            : null,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Text(
                    "User id ${widget.task.userId}",
                    style: TextStyle(
                        decoration: widget.task.completed == true
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  )
                ],
              ),
            ),
            Checkbox(
                activeColor: Colors.pinkAccent,
                value: isChecked,
                onChanged: (bool? b1) {
                  setState(() {
                    widget.task.completed = !widget.task.completed!;
                    isChecked = b1!;
                  });
                }),
          ],
        ),
      ),
    );
    ;
  }
}
