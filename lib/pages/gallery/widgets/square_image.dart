import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shutterstock_scroll/classes/image_data.dart';

class SquareImage extends StatelessWidget {
  final ImageData _imageData;
  
  const SquareImage(this._imageData);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => print('Image tapped'),
        child: Hero(
            key: UniqueKey(),
            tag: _imageData.id,
            child: CachedNetworkImage(
              placeholder: (BuildContext context, String string) =>  Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey,
                      child: Container( color: Colors.white54,)),
              errorWidget: (BuildContext context, String message, Object error) =>
                  Image.asset('assets/placeholder.png', key: Key('placeholder' + _imageData.id)),
              imageUrl: _imageData.url,
              fit: BoxFit.cover,
            )));
    }
}
