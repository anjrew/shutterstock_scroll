import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shutterstock_scroll/widgets/error_widget/error_widget.dart';

void main() {
    testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
        // Test code goes here.
        await tester.pumpWidget(ErrorMessageWidgetWrapper());
        final Finder titleFinder = find.text('Error');
        final Finder messageFinder = find.text('Test');
        final Finder okButtonText = find.text('OK');
        expect(titleFinder, findsOneWidget);
        expect(messageFinder, findsOneWidget);
        expect(okButtonText, findsOneWidget);
    });
}

// Must wrap the Widget in a Material app for testing
class ErrorMessageWidgetWrapper extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Flutter Demo',
        home: ErrorMessageWidget(message: "Test", okAction: () => print('Ok pressed')),
        );
    }
}