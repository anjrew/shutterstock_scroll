import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shutterstock_scroll/classes/image_data.dart';
import 'package:shutterstock_scroll/pages/image_view/image_view.dart';

void main() {
  final ImageData imageData = new ImageData(
      url: 'http://gekomim.rs/imuesewe',
      description:
          "Wuvmibdaj widiru hiz hiod vocbelbo ow ude ne izejueto ifpe od de. Edijulse menafmov api cat omoji vortieri lovo lekulhi feno ton ekelob dij womkorut zooka nosdauj si isve. Ca hulza ud cek tuh vuf ik viujiha suurucof heihail uhebaut zuzoso buliwru ga evile mujjegho. Po ijikarep kehesegi wem veno vompefi ilfoov gugileb hikafrur fu imsocfut efte zinhin. Ajeojjaj muod cutriv mikvo waknobzil gamahfem colpeabu ceb azi guepjo ufdel wuzin su vofsuna ficsot wiluwa we lirujri.",
      id: '973416');

  testWidgets('Title is correct', (WidgetTester tester) async {
    await tester.pumpWidget(ImageViewWidgetWrapper(imageData));
    expect(find.text('Image ${imageData.id}'), findsOneWidget);
  });

  testWidgets('Description is correct', (WidgetTester tester) async {
    await tester.pumpWidget(ImageViewWidgetWrapper(imageData));
    expect(find.text(imageData.description), findsOneWidget);
  });

  testWidgets('Has a hero', (WidgetTester tester) async {
    await tester.pumpWidget(ImageViewWidgetWrapper(imageData));
    expect(find.byType(Hero), findsOneWidget);
  });

  testWidgets('Has a shimmer', (WidgetTester tester) async {
    await tester.pumpWidget(ImageViewWidgetWrapper(imageData));
    expect(find.byType(Shimmer), findsOneWidget);
  });

  testWidgets('Has a cached network image', (WidgetTester tester) async {
    await tester.pumpWidget(ImageViewWidgetWrapper(imageData));
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });

  testWidgets('Imageview has all required widgets in the tree',
      (WidgetTester tester) async {
    // Test code goes here.
    await tester.pumpWidget(ImageViewWidgetWrapper(imageData));
    expect(find.text('Image ${imageData.id}'), findsOneWidget);
    expect(find.text(imageData.description), findsOneWidget);
    expect(find.text(imageData.description), findsOneWidget);
    expect(find.byType(Hero), findsOneWidget);
    expect(find.byType(Shimmer), findsOneWidget);
  });

  testWidgets('Imageview has all required widgets in the tree',
      (WidgetTester tester) async {
    // Test code goes here.
    await tester.pumpWidget(ImageViewWidgetWrapper(imageData));
    expect(find.text('Image ${imageData.id}'), findsOneWidget);
    expect(find.text(imageData.description), findsOneWidget);
    expect(find.text(imageData.description), findsOneWidget);
    expect(find.byType(Hero), findsOneWidget);
    expect(find.byType(Shimmer), findsOneWidget);
  });

  testWidgets("Test UI layout", (WidgetTester tester) async {
    final goldenTestWidget = ImageViewWidgetWrapper(imageData);

    await tester.pumpWidget(goldenTestWidget);

    await expectLater(
      find.byType(ImageViewWidgetWrapper),
      matchesGoldenFile('golden/test_image_view_ui.png'),
      skip: !Platform.isMacOS,
    );
  });
}

// Must wrap the Widget in a Material app for testing
class ImageViewWidgetWrapper extends StatelessWidget {
  final ImageData imageData;

  ImageViewWidgetWrapper(this.imageData);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image test wrapper',
      home: ImageView(imageData),
    );
  }
}
