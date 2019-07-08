import 'package:shutterstock_scroll/logic/main_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
    test('Counter value should be incremented', () {
        final model = MainModel();
        expect(model.pageNumber, 1);
    });

    test(description, body)
}