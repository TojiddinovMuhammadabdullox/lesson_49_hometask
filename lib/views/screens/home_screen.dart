// lib/views/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:hometask/views/screens/notes_screen.dart';
import 'package:hometask/views/screens/todo_screen.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ToDoScreen()),
              );
            },
            child: Card(
              child: Center(child: Text('ToDo')),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotesScreen()),
              );
            },
            child: Card(
              child: Center(child: Text('Notes')),
            ),
          ),
        ],
      ),
    );
  }
}
