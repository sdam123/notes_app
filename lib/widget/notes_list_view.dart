import 'package:flutter/material.dart';
import 'package:note_app/widget/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: const NoteItem(),
        );
      },
    );
  }
}
