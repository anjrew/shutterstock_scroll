import 'package:flutter/material.dart';
import 'package:shutterstock_scroll/logic/main_bloc.dart';
import 'package:shutterstock_scroll/pages/gallery/widgets/square_image.dart';

class GalleryList extends StatefulWidget {
    GalleryList({Key key}) : super(key: key);

    _GalleryListState createState() => _GalleryListState();
}

class _GalleryListState extends State<GalleryList> {

    ScrollController _controller = new ScrollController();

    @override
    Widget build(BuildContext context) {
        return GridView.builder(
            controller: _controller,
            shrinkWrap: true,
            cacheExtent: 10,
            physics: ScrollPhysics(),
            itemCount: MainBloc.of(context).photoData.length,
            key: UniqueKey(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: context.size.width / 4,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 1.0,
            ),
            itemBuilder: (BuildContext context, int index) {
                    return  SquareImage(
                        heroTag: '_herotag',
                        imageUrl: '',
                        placeholder: '',
                    );
                }
        );
    }
}
        
