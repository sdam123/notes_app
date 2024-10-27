import 'package:flutter/material.dart';
import 'package:note_app/widget/custom_appbar.dart';

class NotsBody extends StatelessWidget {
  const NotsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppbar()
        ],
      ),
    );
  }
}
