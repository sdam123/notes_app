import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield(
      {super.key, required this.hint, this.maxline = 1, this.onSaved});
  final void Function(String?)? onSaved;
  String hint;
  int maxline;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kPrimarycolor,
      onSaved: onSaved,
      maxLines: maxline,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'value is requaird';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: kPrimarycolor),
          enabledBorder: buildborder(),
          focusedBorder: buildborder(kPrimarycolor),
          border: buildborder()),
    );
  }

  OutlineInputBorder buildborder([color]) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color == null ? Colors.white : color),
        borderRadius: BorderRadius.circular(8));
  }
}
