import 'package:flutter/material.dart';
import 'package:note_app/widget/custom_appbar.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppbar(
            title: 'Edit Notes',
            icon: Icons.check,
          )
        ],
      ),
    );
  }
}