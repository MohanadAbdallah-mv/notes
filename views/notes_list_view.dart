import 'package:flutter/material.dart';
import 'package:notes/view_models/List_Notes_view_model.dart';
import 'package:provider/provider.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              FloatingActionButton(
                onPressed: () {
                  var notes =
                      Provider.of<NoteListViewModel>(context, listen: false)
                          .Notes[0]
                          .title;
                  print(notes);
                },
                child: Text("click"),
              ),
              GridView.builder(scrollDirection: Axis.vertical,shrinkWrap: true,
                  gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 100,
                      ),
                  itemCount:
                      Provider.of<NoteListViewModel>(context, listen: false)
                          .noteCount,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(Provider.of<NoteListViewModel>(context)
                          .Notes[index].title),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
