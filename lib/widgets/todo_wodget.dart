// lib/views/widgets/todo.dart
import 'package:flutter/material.dart';

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
      ),
      body: Center(
        child: Text('This is the ToDo screen'),
      ),
    );
  }
}
