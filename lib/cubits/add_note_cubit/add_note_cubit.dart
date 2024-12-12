import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddanoteInit());
   

  Color color=Color(0xffAC3931);
  addNote(NoteModel note) async {
        note.color=color.value;
    emit(AddNoteLoading());

    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);
  
      await noteBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
