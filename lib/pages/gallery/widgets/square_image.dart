import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class SquareImage extends StatelessWidget {
  final dynamic imageUrl;
  final String heroTag;
  final String placeholder;

  SquareImage(
      {@required this.placeholder,
      @required this.imageUrl,
      @required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => print('Image tapped'),
        child: Hero(
            key: UniqueKey(),
            tag: heroTag,
            child: CachedNetworkImage(
              placeholder: (BuildContext context, String string) =>
                  Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey,
                      child: Container(
                        color: Colors.white54,
                      )),
              errorWidget: (BuildContext context, String message,
                      Object error) =>
                  Image.asset(placeholder, key: Key('placeholder' + imageUrl)),
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            )));
    }
}
