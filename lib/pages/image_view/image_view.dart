import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shutterstock_scroll/classes/image_data.dart';

class ImageView extends StatelessWidget {
  final ImageData _imageData;

  const ImageView(this._imageData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image"),
        ),
        body: Column(children: <Widget>[
          Hero(
              key: UniqueKey(),
              tag: _imageData.id,
              child: CachedNetworkImage(
                placeholder: (BuildContext context, String string) =>
                    Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.grey,
                        child: Container(
                          color: Colors.white54,
                        )),
                errorWidget:
                    (BuildContext context, String message, Object error) =>
                        Image.asset('assets/placeholder.png',
                            key: Key('placeholder' + _imageData.id)),
                imageUrl: _imageData.url,
                fit: BoxFit.cover,
              )),
          Text(_imageData.description)
        ]));
  }
}
