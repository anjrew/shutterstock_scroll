import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class SSLoader extends StatefulWidget {
    SSLoader({Key key}) : super(key: key);

    _SSLoaderState createState() => _SSLoaderState();
}

class _SSLoaderState extends State<SSLoader> with SingleTickerProviderStateMixin{
	Animation rotate;
	AnimationController _animationController;

	@override
	void initState() { 
	  super.initState();
	  _animationController = AnimationController(vsync: this);
	  _animationController.repeat();
	}
	

    @override
    Widget build(BuildContext context) => 
		RotationTransition(
			turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
			child: Image.asset('assets/icon.png',
				key: ValueKey('spinner'),
				width: 300,
				height: 300,
	));
}
