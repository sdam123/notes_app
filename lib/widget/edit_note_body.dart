import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widget/custom_appbar.dart';
import 'package:note_app/widget/custom_text_field.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.note});

  final NoteModel note ;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? title,content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomAppbar(
              onTap: () {
                widget.note.title=title ?? widget.note.title;
                widget.note.content=content ?? widget.note.content;
                widget.note.save();
                BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
                Navigator.of(context).pop();
              },
              title: 'Edit Notes',
              icon: Icons.check,
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextfield(hint: widget.note.title,
              onChanged: (p0) {
                title=p0;
              },
            
            ),
            SizedBox(
              height: 24,
            ),
            CustomTextfield(
              onChanged: (p0) {
                content=p0;
              },
              hint: widget.note.content,
              maxline: 15,
            )
          ],
        ),
      ),
    );
  }
}
