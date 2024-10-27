import 'package:flutter/material.dart';
import 'package:note_app/widget/nots_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: NotsBody());
  }
}
