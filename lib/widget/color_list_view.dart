

import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 38,
      backgroundColor: Colors.amber,
    );
  }
}

class ColorListView extends StatelessWidget {
  const ColorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 38*2,
        
        child: ListView.builder(itemBuilder: (context, index) {
          
                return ColorItem();
        },
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
