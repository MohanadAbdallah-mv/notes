import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes/constants.dart';
import 'package:notes/view_models/List_Notes_view_model.dart';
import 'package:notes/views/Add_Note_Screen.dart';
import 'package:notes/views/LogIn.dart';
import 'package:notes/widgets/CustomText.dart';
import 'package:provider/provider.dart';

import '../widgets/grid_tile_widget.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    Provider.of<NoteListViewModel>(context, listen: false)
        .updateNotes(); // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF393939),
        child: Icon(
          Icons.draw,
          color: focusColor,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNoteScreen()));
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 5,right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Row(
              children: [SizedBox(width: 15,),
                CustomText(text: "Couldn't sync notes",color: smallTextColor,),SizedBox(width: 10,),
                GestureDetector(onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => LogIn()));
                }, child: CustomText(text: 'Sync Now',),)
              ],
            ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: Consumer<NoteListViewModel>(
                  builder: (context, notedata, child) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            childAspectRatio: 3 / 2,
                            mainAxisExtent: 350),
                        itemCount:
                        notedata.noteCount,
                        itemBuilder: (BuildContext context, index) {
                          return Grid_Tile_Widget(index);
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Container(
// alignment: Alignment.center,
// decoration: BoxDecoration(
// color: Colors.red,
// borderRadius: BorderRadius.circular(15)),
// child: Text(Provider.of<NoteListViewModel>(context)
//     .Notes[index].title),
// )
