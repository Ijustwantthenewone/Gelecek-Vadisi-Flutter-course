class Todo {
  Todo(
      {required this.id,
      required this.todo,
      required this.completed,
      required this.userId});

  int? id;
  String? todo;
  bool? completed;
  int? userId;

  Todo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    todo = json["todo"];
    completed = json["completed"];
    userId = json["userId"];
  }

  Map<String, dynamic> toJson() { 
    Map<String, dynamic> harita = {};
    harita["id"] = id;
    harita["todo"] = todo;
    harita["completed"] = completed;
    harita["userId"] = userId;
    return harita;
  }
}
