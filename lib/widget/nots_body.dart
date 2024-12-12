import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:note_app/widget/custom_appbar.dart';
import 'package:note_app/widget/note_item.dart';
import 'package:note_app/widget/notes_list_view.dart';

class NotsBody extends StatefulWidget {
  const NotsBody({super.key});

  @override
  State<NotsBody> createState() => _NotsBodyState();
}

class _NotsBodyState extends State<NotsBody> {
   bool isSearching=false;
    String searchText ='';
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppbar(
            widget: isSearching ? SearchView(onSubmitted: (p0) {
              BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes(p0);
              isSearching =false;
              setState(() {
                
              });
            },) : Spacer(),
            title: 'Notes',
            icon: Icons.search,
            onTap: () {
                isSearching=true;

                setState(() {
                  
                });
            },
          ),
          Expanded(child: NotesListView())
        ],
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({
    super.key, this.onSubmitted,
  });
    final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return SizedBox(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
onSubmitted: onSubmitted,
                   
      ),
    ),
    width: 248,);
  }
}
