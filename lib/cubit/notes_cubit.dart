import 'dart:collection';

import 'package:flutter_app/mode/note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesState {
  final UnmodifiableListView notes;
  NotesState(this.notes);
}

class NotesCubit extends Cubit<NotesState>{
  List _notes = [];
  int  autoIncrementId = 0;
  NotesCubit (): super(NotesState(UnmodifiableListView([])));

  void createNote(String title, String body){
    _notes.add(Note(++autoIncrementId, title, body));
    emit(NotesState(UnmodifiableListView(_notes)));
  }

  void deleteNote(int id){
    _notes = _notes.where((element) => element.id != id).toList();
    emit(NotesState(UnmodifiableListView(_notes)));
  }
}
