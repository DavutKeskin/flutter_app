import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/notes_cubit.dart';
import 'package:flutter_app/home_page.dart';
import 'package:flutter_app/note_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('home page', () {
    _pumpTestWidget(WidgetTester tester, NotesCubit cubit) =>
        tester.pumpWidget(MaterialApp(
          home: MyHomePage(
            title: "Notes Home Page",
            notesCubit: cubit,
          ),
        ));

    testWidgets("empty state", (WidgetTester tester) async {
      await _pumpTestWidget(tester, NotesCubit());
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNothing);
    });

    testWidgets('updates list when a note is a added',
        (WidgetTester tester) async {
      var notesCubit = NotesCubit();
      await _pumpTestWidget(tester, notesCubit);
      var expectedTitle = 'note title';
      var expectedBody = 'note body';

      notesCubit.createNote(expectedTitle, expectedBody);
      notesCubit.createNote('another title', 'another body');

      await tester.pump();

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(2));
      expect(find.text(expectedTitle), findsOneWidget);
      expect(find.text(expectedBody), findsOneWidget);

    });

    testWidgets("update list when a note deleted ", (WidgetTester tester) async{
      var notesCubit = NotesCubit();
      await _pumpTestWidget(tester, notesCubit);
      var expectedTitle = 'note title';
      var expectedBody = 'note title';

      notesCubit.createNote(expectedTitle, expectedBody);
      notesCubit.createNote('another title', 'another body');

      await tester.pump();

      notesCubit.deleteNote(1);
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
      expect(find.text(expectedTitle), findsNothing);
    });

    testWidgets('navigate to note page', (WidgetTester tester) async {
      var notesCubit = NotesCubit();
      await _pumpTestWidget(tester, notesCubit);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(NotePage), findsOneWidget);

    });
  });
}
