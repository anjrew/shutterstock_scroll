import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/testing.dart';
import 'package:shutterstock_scroll/logic/main_model.dart';
import 'package:shutterstock_scroll/pages/main_page/widgets/gallery_list.dart';
import 'package:shutterstock_scroll/pages/main_page/widgets/square_image.dart';

void main() {
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

  MainModel mainModel = MainModel(httpClient: mockHttp);

  testWidgets('Gallery testss', (WidgetTester tester) async {
    final testWidget = GalleryListWidgetWrapper(mainModel: mainModel);

    await tester.pumpWidget(testWidget);
    expect(find.byKey(ValueKey('GalleryList')), findsOneWidget);
    expect(find.byType(SquareImage), findsWidgets);
  });

  testWidgets("Test UI layout", (WidgetTester tester) async {
    final goldenTestWidget = GalleryListWidgetWrapper(mainModel: mainModel);

    await tester.pumpWidget(goldenTestWidget);

    await expectLater(
      find.byType(GalleryListWidgetWrapper),
      matchesGoldenFile('golden/gallery_list_image_ui.png'),
      skip: !Platform.isMacOS,
    );
  });
}

class MockMainModel extends Mock implements MainModel {}

// Must wrap the Widget in a Material app for testing
class GalleryListWidgetWrapper extends StatelessWidget {
  final MainModel mainModel;

  const GalleryListWidgetWrapper({@required this.mainModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter GalleryList tests',
        home: ScopedModel(
            model: mainModel,
            child: Material(
              child: CustomScrollView(slivers: <Widget>[GalleryList()]),
            )));
  }
}
