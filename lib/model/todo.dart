class Todo {
  String name;
  bool isCompleted;

  Todo(this.name, {this.isCompleted = false});
}

class TodoModel {
  List<Todo> _tasks = [];

  List<Todo> get tasks => _tasks;

  void addTask(String taskName) {
    _tasks.add(Todo(taskName));
  }

  void editTask(int index, String newTaskName) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].name = newTaskName;
    }
  }

  void deleteTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
    }
  }

  void toggleTaskStatus(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    }
  }
}
