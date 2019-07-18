import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shutterstock_scroll/classes/image_data.dart';
import 'package:shutterstock_scroll/pages/main_page/widgets/square_image.dart';

void main() {

     final ImageData imageData = new ImageData(
                            url: 'http://gekomim.rs/imuesewe',
                            description: "Wuvmibdaj widiru hiz hiod vocbelbo ow ude ne izejueto ifpe od de. Edijulse menafmov api cat omoji vortieri lovo lekulhi feno ton ekelob dij womkorut zooka nosdauj si isve. Ca hulza ud cek tuh vuf ik viujiha suurucof heihail uhebaut zuzoso buliwru ga evile mujjegho. Po ijikarep kehesegi wem veno vompefi ilfoov gugileb hikafrur fu imsocfut efte zinhin. Ajeojjaj muod cutriv mikvo waknobzil gamahfem colpeabu ceb azi guepjo ufdel wuzin su vofsuna ficsot wiluwa we lirujri.",
                            id: '973416');


    testWidgets('MyWidget has a title and message', (WidgetTester tester) async {

        final testWidget = SquareImageWidgetWrapper(imageData);

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

        final goldenTestWidget = SquareImageWidgetWrapper(imageData);
        
        await tester.pumpWidget(goldenTestWidget);
  
        await expectLater(
            find.byType(SquareImageWidgetWrapper),
            matchesGoldenFile(
                'golden/test_square_image_ui.png'),
                    skip: !Platform.isMacOS,);

    });
}

// Must wrap the Widget in a Material app for testing
class SquareImageWidgetWrapper extends StatelessWidget {

    final ImageData imageData;

    const SquareImageWidgetWrapper(this.imageData);

    @override
    Widget build(BuildContext context) {

        return MaterialApp(
            title: 'Flutter Tests',
            home:  Material(child:SquareImage(imageData),)
        );
    }
}