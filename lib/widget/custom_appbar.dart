import 'package:flutter/material.dart';
import 'package:note_app/widget/custom_icon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title, required this.icon, this.onTap, required this.widget});
  final String title;
  final IconData icon;
  final void Function()? onTap;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24),
        ),
       widget,
        CustumIcon(icon: icon ,onTap: onTap,)
      ],
    );
  }
}
