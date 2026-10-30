import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_library_app/main.dart';

void main() {
  testWidgets('search is case-insensitive and shows an empty message',
      (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Movie Library'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'ANIMATION');
    await tester.pump();
    expect(find.text('Toy Story'), findsOneWidget);
    expect(find.text('Inception'), findsNothing);

    await tester.enterText(find.byType(TextField), 'zzz');
    await tester.pump();
    expect(find.text('No movies found'), findsOneWidget);
  });

  testWidgets('tapping the discount changes it on every card', (tester) async {
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byIcon(Icons.grid_view));
    await tester.pump();

    expect(find.text('20%'), findsWidgets);
    await tester.tap(find.text('20%').first);
    await tester.pump();
    expect(find.text('20%'), findsNothing);
    expect(find.text('19%'), findsWidgets);
  });
}
