import 'package:todo/tasktype.dart';

class Task {
  final String title;
  final String description;
        bool isCompleted;
  final Tasktype type;

  Task(
      {required this.type,required this.title,
      required this.description,
      required this.isCompleted});
}
