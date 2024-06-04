import 'package:flutter/material.dart';
import 'package:hometask/model/todo.dart';

class ResultsScreen extends StatelessWidget {
  final List<Todo> tasks;

  const ResultsScreen({required this.tasks, super.key});

  @override
  Widget build(BuildContext context) {
    final completedTasks = tasks.where((task) => task.isCompleted).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Result Screen"),
      ),
      body: ListView.builder(
        itemCount: completedTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(completedTasks[index].name),
          );
        },
      ),
    );
  }
}
