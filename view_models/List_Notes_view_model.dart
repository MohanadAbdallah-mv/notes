import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/services/Cashe_Helper.dart';
import 'package:notes/models/note_model.dart';

class NoteListViewModel extends ChangeNotifier {
  List<Note> _noteslist = [];

  //List<String> keys=[];
  void newNote(String title, String description) {
    Note note = Note(title, description,DateFormat.jm().format(DateTime.now()));
    //keys.add(title+description);
    _noteslist.add(note);
    saveNotes(_noteslist);
    notifyListeners();
  }

  int get noteCount => _noteslist.length;

  void deleteNote(Note note) {
    _noteslist.remove(note);
    saveNotes(_noteslist);
    notifyListeners();
  }

  void editNoteTitle(Note note, String changedTitle) {
    note.title = changedTitle;
    saveNotes(_noteslist);
    notifyListeners();
  }

  String accessNoteDateTime(Note note) {
    String time = "${note.creationTime}";
    return time;
  }

  void editNoteDescription(Note note, String changedDescription) {
    note.description = changedDescription;
    saveNotes(_noteslist);
    notifyListeners();
  }

  UnmodifiableListView<Note> get Notes {
    return UnmodifiableListView(_noteslist);
  }

  void updateNotes() {
    final List mapper=jsonDecode(CacheData.getData(key: "notes"));
    _noteslist=mapper.map((val)=>Note.fromJson(val)).toList();
//    _noteslist =  List.generate(3, (index) => Note.fromJson((map[index]))) ;
   // _noteslist.mapper.map<Note>( (entry) => Note(entry.key, entry.value)).toList();
    print(_noteslist);
  }
  void saveNotes(List<Note> list){
    var Notemap = list.map((e) {
      return {
        "title": e.title,
        "description":e.description,
        "creationTime":e.creationTime
      };
    }).toList();
    String notes = jsonEncode(Notemap);
    CacheData.setData(key: "notes", value: notes);
  }
}
