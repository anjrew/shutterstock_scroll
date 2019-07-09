import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shutterstock_scroll/pages/main_page/main_page.dart';
import 'package:shutterstock_scroll/pages/main_page/widgets/app_bar.dart';
import 'package:shutterstock_scroll/pages/main_page/widgets/gallery_list.dart';

void main() {

    testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
        await tester.pumpWidget(MainPageWrapper());
        final Finder appBarFinder = find.byElementType(GalleryAppBar);
        final Finder galleryFinder = find.byElementType(GalleryList);
        expect(appBarFinder, findsOneWidget);
        expect(galleryFinder, findsOneWidget);
    });
}

// Must wrap the Widget in a Material app for testing
class MainPageWrapper extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'MainPageWrapper',
        home: MainPage(),
        );
    }
}