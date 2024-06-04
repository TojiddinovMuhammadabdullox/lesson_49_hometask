import 'package:hometask/model/notes.dart';

class NotesController {
  List<Note> notes = [
    Note(
      title: 'First Note',
      subtitle: 'This is the subtitle of the first note',
    ),
    Note(
      title: 'Second Note',
      subtitle: 'This is the subtitle of the second note',
    ),
  ];

  void editNote(int index, String title, String subtitle) {
    notes[index].title = title;
    notes[index].subtitle = subtitle;
  }

  void deleteNote(int index) {
    notes.removeAt(index);
  }

  void addNote(String title, String subtitle) {
    notes.add(Note(
      title: title,
      subtitle: subtitle,
    ));
  }
}
