import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shutterstock_scroll/classes/image_data.dart';
import 'package:shutterstock_scroll/pages/image_view/image_view.dart';

void main() {

    final ImageData imageData = new ImageData(
                            url: 'http://gekomim.rs/imuesewe',
                            description: "Wuvmibdaj widiru hiz hiod vocbelbo ow ude ne izejueto ifpe od de. Edijulse menafmov api cat omoji vortieri lovo lekulhi feno ton ekelob dij womkorut zooka nosdauj si isve. Ca hulza ud cek tuh vuf ik viujiha suurucof heihail uhebaut zuzoso buliwru ga evile mujjegho. Po ijikarep kehesegi wem veno vompefi ilfoov gugileb hikafrur fu imsocfut efte zinhin. Ajeojjaj muod cutriv mikvo waknobzil gamahfem colpeabu ceb azi guepjo ufdel wuzin su vofsuna ficsot wiluwa we lirujri.",
                            id: '973416');

    testWidgets('Imageview has all required widgets in the tree', (WidgetTester tester) async {
        
        // Test code goes here.
        await tester.pumpWidget(ImageViewWidgetWrapper(imageData));
        final Finder titleFinder = find.text('Image ${imageData.id}');
        final Finder descriptionFinder = find.text(imageData.description);
        final Finder imageFinder = find.byType(CachedNetworkImage);
        final Finder shimmerFinder = find.byType(Shimmer);
        final Finder heroFinder = find.byType(Hero);
       
        expect(titleFinder, findsOneWidget);
        expect(imageFinder, findsOneWidget);
        expect(shimmerFinder, findsOneWidget);
        expect(heroFinder, findsOneWidget);
        expect(descriptionFinder, findsOneWidget);
        
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