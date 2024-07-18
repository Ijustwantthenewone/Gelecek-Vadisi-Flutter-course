import 'dart:convert';

import 'package:todo/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  final String url = "https://dummyjson.com/todos";
  final String addUrl = "https://dummyjson.com/todos/add";

  Future<List<Todo>> getUnTodos() async {
    var response = await http.get(Uri.parse(url));
    List<dynamic> resp =
        jsonDecode(response.body)["todos"]; // darta çeviriyor 20:17
    List<Todo> todos = List.empty(growable: true);

    for (var x in resp) {
      Todo task = Todo.fromJson(x);
      if (task.completed == false) {
        todos.add(task);
      }
    }

    return todos;
  }

  Future<List<Todo>> getCompletedTodos() async {
    var response = await http.get(Uri.parse(url));
    List<dynamic> resp =
        jsonDecode(response.body)["todos"]; // darta çeviriyor 20:17
    List<Todo> todos = List.empty(growable: true);

    for (var x in resp) {
      Todo task = Todo.fromJson(x);
      if (task.completed == true) {
        todos.add(task);
      }
    }

    return todos;
  }

  Future<String> addTodo(Todo newtodo) async {
    var response = await http.post(Uri.parse(addUrl),
        body: jsonEncode(newtodo.toJson()),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        });
    print(response.body);
    return response.body;
  }
}
