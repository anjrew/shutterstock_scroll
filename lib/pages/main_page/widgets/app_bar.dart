import 'package:flutter/material.dart';

class GalleryAppBar extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return SliverAppBar(
            floating: true,
            title: Text('Shutterstock Scroller')
        );
    }
}