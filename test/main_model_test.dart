import 'package:http/http.dart';
import 'package:matcher/matcher.dart';
import 'package:shutterstock_scroll/classes/image_data.dart';
import 'package:shutterstock_scroll/logic/main_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/testing.dart';

class MockHttp extends Mock implements Client {}

void main() async {
  // http.Client mockHttp = MockHttp();
  Client mockHttp = MockClient((request) async {
    return Response('''
                  {
                    "data": [
                        {
                            "assets": { 
                                "huge_thumb" : { 
                                    "url": "http://saohiazo.jp/mup"
                                    }   
                                },
                            "description": "Ace nibnofrik hin c.",
                            "id": "257290"
                        },
                        {   
                            "assets": { 
                                "huge_thumb" : { 
                                        "url": "http://gekomim.rs/imuesewe"
                                    }   
                                },
                            "description": "Wuvmibdaj widiru.",
                            "id": "973416"
                        },
                        {   
                            "assets": { 
                                "huge_thumb" : { 
                                        "url": "http://fesiloh.ci/ebu"
                                    }   
                                },
                            "description": "Je ju la puoza gijuud.",
                            "id": "160790"
                        }
                    ]
                }
            ''', 200);
  });

  final model = MainModel(httpClient: mockHttp);

  test('Get more images increments', () async {
    List<ImageData> mockedResult = await model.getImages(1);

    expect(
        mockedResult[0],
        new TypeMatcher<ImageData>()
            .having((ImageData data) => data.id, 'id', equals("257290"))
            .having((ImageData data) => data.url, 'url',
                equals("http://saohiazo.jp/mup"))
            .having((ImageData data) => data.description, 'description',
                equals("Ace nibnofrik hin c.")));
  });

  test('Counter value should be incremented', () {
    expect(model.pageNumber, 3);
  });
}
