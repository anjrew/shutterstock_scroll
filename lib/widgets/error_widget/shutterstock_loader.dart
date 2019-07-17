import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:shutterstock_scroll/logic/main_model.dart';
import 'package:shutterstock_scroll/classes/error_reporting.dart' as sentry;

class SSLoader extends StatefulWidget {
    SSLoader({Key key}) : super(key: key);

    _SSLoaderState createState() => _SSLoaderState();
}

class _SSLoaderState extends State<SSLoader>
        with SingleTickerProviderStateMixin {
    Animation rotate;
    AnimationController _animationController;
    Image image;

    @override
    void initState() {
        super.initState();
        _animationController =
                AnimationController(vsync: this, duration: Duration(seconds: 1));
        _animationController.repeat();

        try {
            image = Image.asset(
                'assets/icon/spinner/icon.png',
                key: ValueKey('spinner'),
                width: 100,
                height: 100,
            );
        } catch (e) {
            MainModel.of(context).error = e;
            sentry.report(e);
        }
    }

    @override
    Widget build(BuildContext context) => RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Hero(
				tag: 'spinner',
				child: image),);

    @override
    void dispose() {
        _animationController.dispose();
        super.dispose();
    }
}
