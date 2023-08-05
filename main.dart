import 'package:flutter/material.dart';
import 'package:notes/view_models/List_Notes_view_model.dart';
import 'package:provider/provider.dart';
import 'views/notes_list_view.dart';

void main() {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NoteListViewModel(),
        child: MaterialApp(
          home: NotesListView(),
        ));
  }
}
