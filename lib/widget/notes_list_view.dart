import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widget/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<NoteModel> notes =
        BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();

    return BlocBuilder<NotesCubitCubit, NotesCubitState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 4),
          child: ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: NoteItem(
                  note: notes[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
