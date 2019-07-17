import 'package:flutter/material.dart';
import 'package:shutterstock_scroll/logic/main_model.dart';
import 'package:shutterstock_scroll/classes/error_reporting.dart' as sentry;
import 'package:shutterstock_scroll/pages/main_page/main_page.dart';
import 'package:shutterstock_scroll/routes/transitions/fade_route.dart';


class SplashScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {

		Future(() => Navigator.push(context, FadeRoute(page: MainPage())));

		Image image;
        try {
            image = Image.asset(
                'assets/icon/spinner/icon.png',
                key: ValueKey('spinner'),
                width: 250,
                height: 250,
            );
        } catch (e) {
            MainModel.of(context).error = e;
            sentry.report(e);
        }

        return Container(
            child: Hero(tag: 'spinner', child: image),
        );
    }
}
