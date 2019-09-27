import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shutterstock_scroll/widgets/error_widget/error_widget.dart';

void main() {
  testWidgets('Message is correct', (WidgetTester tester) async {
    await tester.pumpWidget(ErrorMessageWidgetWrapper());
    expect(find.text('Test'), findsOneWidget);
  });

  testWidgets('Title is correct', (WidgetTester tester) async {
    await tester.pumpWidget(ErrorMessageWidgetWrapper());
    expect(find.text('Error'), findsOneWidget);
  });

  testWidgets('Button text is correct', (WidgetTester tester) async {
    await tester.pumpWidget(ErrorMessageWidgetWrapper());
    expect(find.text('OK'), findsOneWidget);
  });

  testWidgets('Is within an alert diolog', (WidgetTester tester) async {
    await tester.pumpWidget(ErrorMessageWidgetWrapper());
    expect(find.byType(AlertDialog), findsOneWidget);
  });

  testWidgets('Has material button', (WidgetTester tester) async {
    await tester.pumpWidget(ErrorMessageWidgetWrapper());
    expect(find.byType(MaterialButton), findsOneWidget);
  });

  testWidgets("Test UI layout", (WidgetTester tester) async {
    final goldenTestWidget = ErrorMessageWidgetWrapper();

    await tester.pumpWidget(goldenTestWidget);

    await expectLater(
      find.byType(ErrorMessageWidgetWrapper),
      matchesGoldenFile('golden/test_error_widget_ui.png'),
      skip: !Platform.isMacOS,
    );
  });
}

// Must wrap the Widget in a Material app for testing
class ErrorMessageWidgetWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Error wrapper',
      home: ErrorMessageWidget(
          message: "Test", okAction: () => print('Ok pressed')),
    );
  }
}
