import 'package:shutterstock_scroll/logic/main_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockHttp extends Mock implements http.Client {}

void main() {
    final mockHttp = MockHttp();
    final model = MainModel();

    test('Counter value should be incremented', () {

        expect(model.pageNumber, 1);

    });

    test('Get more images increments', (){
        when(mockHttp.get('https://api.shutterstock.com/v2/images/search?per_page=10&&page=1'))
                .thenAnswer((Invocation invocation) 
                    async => http.Response('This is a JSON',200));

        expect(model.getimages(1), isFlutterError);
    });
}