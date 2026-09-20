import 'package:flutter/cupertino.dart';

class Task {
  final String title;
  final String description;
  bool isDone;

  Task({required this.title, required this.description, this.isDone = false});
}

class TodoModel extends ChangeNotifier {
  final List<Task> _task = [];

  List<Task> get task => _task;

  void addTask(String title, String desc) {
    _task.add(Task(title: title, description: desc));
    notifyListeners();
  }

  void deleteTask(int index) {
    _task.removeAt(index);
    notifyListeners();
  }

  void toggleTask(int index) {
    _task[index].isDone = !_task[index].isDone;
    notifyListeners();
  }
}
