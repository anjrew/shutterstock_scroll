import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return SliverAppBar(
            floating: true,
            title: Text('Shutterstock Scroller')
        );
    }
}