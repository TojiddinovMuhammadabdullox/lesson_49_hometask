import 'package:flutter/material.dart';
import 'package:hometask/model/todo.dart';

class TodoController extends ChangeNotifier {
  final TodoModel _taskModel = TodoModel();

  List<Todo> get tasks => _taskModel.tasks;

  void addTask(String taskName) {
    _taskModel.addTask(taskName);
    notifyListeners();
  }

  void editTask(int index, String newTaskName) {
    _taskModel.editTask(index, newTaskName);
    notifyListeners();
  }

  void deleteTask(int index) {
    _taskModel.deleteTask(index);
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    _taskModel.toggleTaskStatus(index);
    notifyListeners();
  }
}
