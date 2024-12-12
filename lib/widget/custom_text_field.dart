import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield(
      {super.key, required this.hint, this.maxline = 1, this.onSaved, this.onChanged, required this.degaultText});
  final void Function(String?)? onSaved;
  final String degaultText;
  String hint;
  int maxline;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(text:degaultText),
      cursorColor: kPrimarycolor,
      onSaved: onSaved,
      textInputAction: TextInputAction.done,
      onChanged: onChanged,
      maxLines: maxline,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'value is requaird';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: hint
                ,
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
