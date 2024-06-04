import 'package:flutter/material.dart';
import 'package:hometask/controller/todo_controller.dart';
import 'package:hometask/views/screens/results_screen.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final TodoController _taskController = TodoController();

  void _addTask(String task) {
    setState(() {
      _taskController.addTask(task);
    });
  }

  void _editTask(int index, String newTask) {
    setState(() {
      _taskController.editTask(index, newTask);
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _taskController.deleteTask(index);
    });
  }

  void _toggleTaskStatus(int index) {
    setState(() {
      _taskController.toggleTaskStatus(index);
    });
  }

  void _showTaskDialog({String? initialText, int? index}) {
    final _textController = TextEditingController(text: initialText);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(index == null ? 'Add Task' : 'Edit Task'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(hintText: 'Enter task'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (index == null) {
                  _addTask(_textController.text);
                } else {
                  _editTask(index, _textController.text);
                }
                Navigator.of(context).pop();
              },
              child: Text(index == null ? 'Add' : 'Save'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToResultsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(
          tasks: _taskController.tasks,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showTaskDialog(),
          ),
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _navigateToResultsScreen,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _taskController.tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_taskController.tasks[index].name),
            leading: Checkbox(
              value: _taskController.tasks[index].isCompleted,
              onChanged: (bool? value) {
                _toggleTaskStatus(index);
              },
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _showTaskDialog(
                    initialText: _taskController.tasks[index].name,
                    index: index,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteTask(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
