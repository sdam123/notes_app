import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:note_app/widget/custom_appbar.dart';
import 'package:note_app/widget/note_item.dart';
import 'package:note_app/widget/notes_list_view.dart';

class NotsBody extends StatefulWidget {
  const NotsBody({super.key});

  @override
  State<NotsBody> createState() => _NotsBodyState();
}

class _NotsBodyState extends State<NotsBody> {
  @override
  void initState() {
    //BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
    // String ss = BlocProvider.of<NotesCubitCubit>(context).notes![3].title;
    // print(ss);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppbar(
            title: 'Notes',
            icon: Icons.search,
          ),
          Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
