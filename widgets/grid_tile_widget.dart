import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notes/view_models/List_Notes_view_model.dart';

class Grid_Tile_Widget extends StatelessWidget {
  int index;

  Grid_Tile_Widget(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 9,
            child: GridTile(
                child: Container(
              child: Text(
                Provider.of<NoteListViewModel>(context)
                    .Notes[index]
                    .description,
              ),
              decoration: BoxDecoration(
                  color: Color(0xFF161616),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(13)),
            )),
          ),
          Expanded(
              flex: 1,
              child: Center(
                  child: Text(Provider.of<NoteListViewModel>(context)
                      .Notes[index]
                      .title))),Expanded(
              flex: 1,
              child: Center(
                  child: Text("Date and time",style: TextStyle(color: Color(0xFF727474)),)))
          //    ,
        ],
      ),
    );
  }
}
