import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return EditNoteView();
          },
        ));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 18),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          ListTile(
            title: Text(
              note.title,
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                note.content,
                style: TextStyle(
                    fontSize: 18, color: Colors.black.withOpacity(.4)),
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(note.date,
                style: TextStyle(
                    fontSize: 12, color: Colors.black.withOpacity(.5))),
          )
        ]),
      ),
    );
  }
}
