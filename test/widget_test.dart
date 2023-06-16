// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:saveshare/components/bottom_bar.dart';
import 'package:saveshare/components/top_bar.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:saveshare/main.dart';

void main() {
  testWidgets('Build Home Page Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    //check if the top bar is there
    expect(find.byType(TopBar), findsOneWidget);
    //check if the bottom bar is there
    expect(find.byType(BottomBar), findsOneWidget);
  });
}
