import 'package:flutter/material.dart';
import 'package:note_app/widget/custom_icon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24),
        ),
        Spacer(),
        CustumIcon(icon: icon)
      ],
    );
  }
}
