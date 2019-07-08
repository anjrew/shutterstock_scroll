import 'package:flutter_test/flutter_test.dart';
import 'package:shutterstock_scroll/widgets/error_widget/error_widget.dart';

void main() {
    // Define a test. The TestWidgets function also provides a WidgetTester
    // to work with. The WidgetTester allows you to build and interact
    // with widgets in the test environment.
    testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
        // Test code goes here.
        await tester.pumpWidget(ErrorMessageWidget(message: "Test", okAction: () => print('Ok pressed'),));
    });
}