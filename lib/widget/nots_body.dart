import 'package:flutter/material.dart';
import 'package:note_app/widget/custom_appbar.dart';
import 'package:note_app/widget/note_item.dart';
import 'package:note_app/widget/notes_list_view.dart';

class NotsBody extends StatelessWidget {
  const NotsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppbar(),
          Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
