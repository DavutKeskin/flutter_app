import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';

class NotesState {
  final UnmodifiableListView notes;
  NotesState(this.notes);
}

class NotesCubit extends Cubit<NotesState>{
  List _notes = [];
  NotesCubit (): super(NotesState(UnmodifiableListView([])));
}
