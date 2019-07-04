import 'package:flutter/material.dart';
import 'package:shutterstock_scroll/pages/gallery/widgets/app_bar.dart';

class Gallery extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            slivers: <Widget>[

                GalleryAppBar(),


            ]
        )
    );
  }
}