import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widget/custom_appbar.dart';
import 'package:note_app/widget/custom_text_field.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.note});

  final NoteModel note ;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? title,content;
     
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomAppbar(
              widget: Spacer(),
              onTap: () {
                widget.note.title=title ?? widget.note.title;
                widget.note.content=content ?? widget.note.content;
                widget.note.save();
                BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes('');
                Navigator.of(context).pop();
              },
              title: 'Edit Notes',
              icon: Icons.check,
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextfield(hint: 'title',
            degaultText: widget.note.title,
              onChanged: (p0) {
              
                title=p0;
              },
            
            ),
            SizedBox(
              height: 24,
            ),
            CustomTextfield(
              degaultText: widget.note.content,
              onChanged: (p0) {
                
                content=p0;
              },
              hint: 'content',
              maxline: 15,
            ),
            ColorListViewEdit(note: widget.note,)
         
          ],
        ),
      ),
    );
  }
}



















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


class ColorListViewEdit extends StatefulWidget {
  const ColorListViewEdit({super.key, required this.note, });
     final NoteModel note;
   
    
     
  @override
  State<ColorListViewEdit> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListViewEdit> {

  
   
  List<Color> colors = const
  [Color(0xffAC3931),
  Color(0xffE5D352),Color(0xffD9E76C),Color(0xff537D8D),Color(0xff482C3D),];
     
       late  int corruntIndix=0;
       @override
  void initState() {
     corruntIndix=colors.indexOf(Color(widget.note.color));
    super.initState();
  }

 
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
                         widget.note.color=colors[index].value;
                         widget.note.save();
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

