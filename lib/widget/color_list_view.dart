

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
   final bool isActive;
   final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive ?
     CircleAvatar(
      radius: 38,
      backgroundColor: Colors.white,
       child: CircleAvatar(
        radius: 36,
        backgroundColor: color,
         ),
     ) :  CircleAvatar(
      radius: 38,
      backgroundColor: color,
    );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {

  int corruntIndix=0;
  List<Color> colors = const
  [Color(0xffAC3931),
  Color(0xffE5D352),Color(0xffD9E76C),Color(0xff537D8D),Color(0xff482C3D)];
 
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 38*2 + 8,
        
        child: ListView.builder(itemBuilder: (context, index) {
          
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap:() {
                      corruntIndix=index;
                      BlocProvider.of<AddNoteCubit>(context).color=colors[index];
                      setState(() {
                        
                      });
                    },
                    child: ColorItem( isActive: index==corruntIndix,
                    color: colors[index],)),
                );
        },
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
