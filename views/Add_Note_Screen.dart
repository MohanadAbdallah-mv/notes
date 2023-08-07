import 'package:flutter/material.dart';
import 'package:notes/view_models/List_Notes_view_model.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  late String title;
  late String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: Container(
        color: Color(0xff757575),
        child: Container(

          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add Note",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (new_title) {
                  title = new_title;
                },
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (new_desc) {
                  description = new_desc;
                },
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlueAccent),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  print(title);
                  print(description);
                  Provider.of<NoteListViewModel>(context, listen: false)
                      .newNote(title, description);

                  Navigator.pop(context);
                },
                child: Text("Add"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
