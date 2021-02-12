import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  final NotesCubit notesCubit;
  final String title;

  MyHomePage({Key key, this.title, this.notesCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<NotesCubit, NotesState>(
        cubit: notesCubit,
        builder: (context, state) => ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              var note = state.notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.body),
              );
            }),
      ),
    );
  }
}
