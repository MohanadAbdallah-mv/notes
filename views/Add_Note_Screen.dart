import 'package:flutter/material.dart';
import 'package:notes/constants.dart';
import 'package:notes/view_models/List_Notes_view_model.dart';
import 'package:notes/widgets/CustomButton.dart';
import 'package:notes/widgets/CustomText.dart';
import 'package:provider/provider.dart';
import 'package:notes/models/note_model.dart';
import 'package:intl/intl.dart';

class AddNoteScreen extends StatefulWidget {
  Note? note;

  AddNoteScreen({this.note});

  AddNoteScreen.empty();

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  late String tempTitle;

  late String tempDescription;

  //late TextEditingController titlee;
  bool isOpen = false;

  @override
  void initState() {
    if (widget.note != null) {
      title.text = widget.note!.title;
      description.text = widget.note!.description;
    } // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          textAlign: TextAlign.start,
          controller: title,
          cursorColor: Color(0xFFE75E4E),
          decoration: InputDecoration(hintText: "Title"),
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: isOpen ? 50 : 25),
          onChanged: (new_title) {
            tempTitle = new_title;
          },
          onTapOutside: (value) {
            setState(() {
              isOpen = !isOpen;
            });
          },
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
        ),
        bottom: PreferredSize(
          child: isOpen
              ? Container(color: Colors.black, height: 100)
              : Container(),
          preferredSize: Size.fromHeight(isOpen ? 100 : 0),
        ),
      ),
      body: Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 9,
                child: TextField(
                  maxLines: null,
                  minLines: 30,
                  autofocus: true,
                  textAlign: TextAlign.start,
                  cursorColor: Color(0xFFE75E4E),
                  controller: description,
                  onChanged: (new_desc) {
                    tempDescription = new_desc;
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Consumer<NoteListViewModel>(
                  builder: (context, notedata, child) {
                    return CustomButton(
                        child: CustomText(
                          text: widget.note == null ? "Add" : "Save",
                          align: Alignment.center,
                        ),
                        gradient: gradient,
                        onpress: () {
                          if ((title.text).isEmpty) {
                            title.text =
                                DateFormat.MMMd().format(DateTime.now());
                          }
                          if (widget.note != null) {
                            notedata.editNoteDescription(
                                widget.note!, description.text);
                            notedata.editNoteTitle(widget.note!, title.text);
                          } else {
                            notedata.newNote(title.text, description.text);
                          }
                          print(notedata.Notes[1]);
                          Navigator.pop(context);
                        });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// TextButton(
// style: ButtonStyle(
// backgroundColor:
// MaterialStateProperty.all(Color(0xFFE75E4E)),
// foregroundColor:
// MaterialStateProperty.all(Colors.white)),

// child: Text(widget.note == null ? "Add" : "Save"),
// )
