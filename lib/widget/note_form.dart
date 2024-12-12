import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widget/color_list_view.dart';
import 'package:note_app/widget/costum_buttun.dart';
import 'package:note_app/widget/custom_text_field.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({
    super.key,
  });

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          CustomTextfield(
            degaultText: '',
            hint: 'title',
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextfield(
            degaultText: '',
            onSaved: (value) {
              content = value;
            },
            hint: 'content',
            maxline: 5,
          ),
             ColorListView(),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) => CustomButton(
              isLooding: state is AddNoteLoading ? true : false,
              onTap: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  NoteModel noteModel = NoteModel(
                      color: Colors.amber.value,
                      title: title!,
                      content: content!,
                      date: DateFormat.yMd().format(DateTime.now()),
                      );

                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

