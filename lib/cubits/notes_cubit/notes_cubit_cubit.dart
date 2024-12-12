import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:meta/meta.dart';
import 'package:note_app/models/note_model.dart';

import 'package:note_app/constants.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
          static String? ser='';
  List<NoteModel> fetchAllNotes( String? serch) {
    var noteBox = Hive.box<NoteModel>(kNoteBox);
       String? ser=serch;
       List<NoteModel> notes = noteBox.values.toList();
       
       if(ser==''){
         emit(NoteRefresh());
           return notes;
       }else {
      List<NoteModel> newNotes=[];
        for(int i=0;i<notes.length;i++){

        if(notes[i].title==ser)
      
          newNotes.add(notes[i]);

        }
        emit(NoteSearch());
        return newNotes;
       }
    
 
    
  }
}
