import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/notes_cubit.dart';
import 'package:flutter_app/note_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Note page", () {
    _pumpTestWidget(WidgetTester tester, NotesCubit cubit) =>
        tester.pumpWidget(
            MaterialApp(
              home: NotePage(
                notesCubit: cubit,
              ),
            )
        );

    testWidgets('empty state', (WidgetTester tester) async {
      await _pumpTestWidget(tester, NotesCubit());
      expect(find.text("enter your text here..."), findsOneWidget);
      expect(find.text('title'), findsOneWidget);
    });
  });
}
