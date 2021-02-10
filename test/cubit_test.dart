import 'package:flutter_app/cubit/notes_cubit.dart';
import 'package:flutter_app/mode/note.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("Notes cubit", (){
    test("default is empty", (){
      var cubit = NotesCubit();
      expect(cubit.state.notes, []);
    });

    test("add notes", (){
      var title = 'title';
      var body = 'body';
      var cubit = NotesCubit();

      cubit.createNote(title, body);
      expect(cubit.state.notes.length, 1);
      expect(cubit.state.notes.first, Note(1, title, body));

    });

    test("delete notes", (){
      var cubit = NotesCubit();
      cubit.createNote('title', 'body');
      cubit.createNote('another title', 'another body');

      cubit.deleteNote(1);

      expect(cubit.state.notes.length, 1);
      expect(cubit.state.notes.first.id, 2);
    });

  });
}
