import 'package:flutter/material.dart';
import 'package:note_app/widget/custom_appbar.dart';
import 'package:note_app/widget/custom_text_field.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomAppbar(
              title: 'Edit Notes',
              icon: Icons.check,
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextfield(hint: 'title'),
            SizedBox(
              height: 24,
            ),
            CustomTextfield(
              hint: 'content',
              maxline: 15,
            )
          ],
        ),
      ),
    );
  }
}
