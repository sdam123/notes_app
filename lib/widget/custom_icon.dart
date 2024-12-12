import 'package:flutter/material.dart';

class CustumIcon extends StatelessWidget {
  const CustumIcon({super.key, required this.icon, this.onTap});
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46,
        width: 46,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white.withOpacity(.05)),
        child: Center(
            child: Icon(
          icon,
          size: 28,
        )),
      ),
    );
  }
}
