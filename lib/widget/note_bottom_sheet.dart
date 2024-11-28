import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';

import 'package:note_app/widget/costum_buttun.dart';
import 'package:note_app/widget/custom_text_field.dart';
import 'package:note_app/widget/note_form.dart';

class NoteBottomSheet extends StatelessWidget {
  const NoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16 + MediaQuery.of(context).viewInsets.bottom),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          builder: (BuildContext context, AddNoteState state) {
            return SingleChildScrollView(child: NoteForm());
          },
          listener: (BuildContext context, AddNoteState state) {
            if (state is AddNoteFailure) {
              print('Failied ${state.errMessege}');
            }
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
