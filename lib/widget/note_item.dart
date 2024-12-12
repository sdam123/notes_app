import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'package:note_app/views/notes_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return EditNoteView(note: note,);
          },
        ));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 18),
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          ListTile(
            title: Text(
              note.title,
                overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                note.content,
                overflow: TextOverflow.ellipsis,
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
              onPressed: () {
                note.delete();
                BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes('');
               
              },
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
