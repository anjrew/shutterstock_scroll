import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shutterstock_scroll/classes/image_data.dart';
import 'package:shutterstock_scroll/logic/main_model.dart';
import 'package:shutterstock_scroll/pages/main_page/widgets/gallery_list.dart';
import 'package:shutterstock_scroll/pages/main_page/widgets/square_image.dart';


void main() {

    testWidgets('MyWidget has a title and message', (WidgetTester tester) async {

		MockMainModel mainModel = MockMainModel();

        final testWidget = GalleryListWidgetWrapper();

        await tester.pumpWidget(testWidget);
        final Finder imageFinder = find.byType(CachedNetworkImage);
        final Finder shimmerFinder = find.byType(Shimmer);
        final Finder heroFinder = find.byType(Hero);

        expect(find.byWidget(testWidget), findsOneWidget);
        expect(find.byType(CachedNetworkImage).first, findsOneWidget);
        expect(testWidget.imageData, imageData);
        expect(imageFinder, findsOneWidget);
        expect(shimmerFinder, findsOneWidget);
        expect(heroFinder, findsOneWidget);
    });

    testWidgets("Test UI layout", (WidgetTester tester) async {

        final goldenTestWidget = GalleryListWidgetWrapper();
        
        await tester.pumpWidget(goldenTestWidget);
  
        await expectLater(
            find.byType(GalleryListWidgetWrapper),
            matchesGoldenFile(
                'golden/test_square_image_ui.png'),
                    skip: !Platform.isMacOS,);

    });
}

class MockMainModel extends Mock implements MainModel {}


// Must wrap the Widget in a Material app for testing
class GalleryListWidgetWrapper extends StatelessWidget {

	final MockMainModel mainModel;

	const GalleryListWidgetWrapper({@required this.mainModel});

    @override
    Widget build(BuildContext context) {

        return MaterialApp(
            title: 'Flutter Tests',
            home:  ScopedModel(
				model:mainModel, 
				child: GalleryList()) ,
        );
    }
}