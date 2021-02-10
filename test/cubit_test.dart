import 'package:flutter_app/cubit/notes_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("Notes cubit", (){
    test("default is empty", (){
      var cubit = NotesCubit();
      expect(cubit.state.notes, []);
    });
  });
}
