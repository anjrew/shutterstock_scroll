import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return SliverAppBar(
            key: ValueKey('mainAppBar'),
            floating: true,
            title: Text('Shutterstock Scroller')
        );
    }
}