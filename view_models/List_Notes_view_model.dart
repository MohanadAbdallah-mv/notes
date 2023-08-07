import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:notes/models/note_model.dart';

class NoteListViewModel extends ChangeNotifier {
  List<Note> _noteslist = [Note("note1title", "descriptiondescriptiondescriptiondescriptiondescription"),Note("note2title", "descriptiondescriptiondescriptiondescriptiondescriptiondescription")];

  void newNote(String title, String description) {
    Note note = Note(title, description);
    _noteslist.add(note);
    notifyListeners();
  }

  int get noteCount => _noteslist.length;

  void deleteTask(Note note) {
    _noteslist.remove(note);
    notifyListeners();
  }

  void editNoteTitle(Note note, String changedTitle) {
    note.title = changedTitle;
    notifyListeners();
  }

  void editNoteDescription(Note note, String changedDescription) {
    note.description = changedDescription;
    notifyListeners();
  }

  UnmodifiableListView<Note> get Notes {
    return UnmodifiableListView(_noteslist);
  }
}