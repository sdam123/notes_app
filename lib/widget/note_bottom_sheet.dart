import 'package:flutter/material.dart';

import 'package:note_app/widget/costum_buttun.dart';
import 'package:note_app/widget/custom_text_field.dart';

class NoteBottomSheet extends StatelessWidget {
  const NoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            CustomTextfield(hint: 'title'),
            SizedBox(
              height: 16,
            ),
            CustomTextfield(
              hint: 'content',
              maxline: 5,
            ),
            SizedBox(
              height: 100,
            ),
            CustomButton()
          ],
        ),
      ),
    );
  }
}
