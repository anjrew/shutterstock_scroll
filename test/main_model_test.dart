import 'dart:convert';
import 'dart:io';

import 'package:shutterstock_scroll/logic/main_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MockHttp extends Mock implements http.Client {}

void main() {
    http.Client mockHttp = MockHttp();
    final model = MainModel();

    test('Counter value should be incremented', () {

        expect(model.pageNumber, 1);

    });

    test('Get more images increments', () async {

        final mockDataFile = new File('test/mock_data/shutterstock_images_mock_data.json');
        final jsonData = json.decode(await mockDataFile.readAsString());

        when(mockHttp.get('https://api.shutterstock.com/v2/images/search?per_page=10&&page=1'))
                .thenAnswer((_) => Future.value(Response(jsonData, 200)));

        var mockedResult = await model.getimages(1);

        expect(mockedResult, {
            "url": "http://saohiazo.jp/mup",
            "description": "Ace nibnofrik hin ita afcaz zez mub lew dudotep ekitoco tamnij oj jezesi kujut kawzikuf ukrigrej lunefub jeom. Mazojatu so ak fahzilic pozus emenu rudhuv olarih wewapga nukve hapus wocat la sup wospefah. Tu binas zecucko ah unpelmih vevbej vubuoro wi ka wikin betores momkelbi. Souwva jura oziforho pame kewzejtu ja huju lon mes zegag nocpobez huka. Uvtukfab zughozeh iniwudni fu uzewes hitdutzob sijo kosij afe vauru ozgibpos rurwac morja licbavze gurwatwev. We dofra rohotuz kag vet kefga hih hifesuh higejnet nokjob joupo zaw finusiw doge vi opiahuec.",
            "id": 257290
        });
    });
}