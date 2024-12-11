import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:meta/meta.dart';
import 'package:note_app/models/note_model.dart';

import 'package:note_app/constants.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());

  List<NoteModel> fetchAllNotes() {
    var noteBox = Hive.box<NoteModel>(kNoteBox);
    List<NoteModel> notes = noteBox.values.toList();
    emit(NoteRefresh());
    return notes;
  }
}
