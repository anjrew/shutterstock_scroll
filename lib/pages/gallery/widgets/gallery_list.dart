import 'package:flutter/material.dart';
import 'package:shutterstock_scroll/classes/image_data.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shutterstock_scroll/logic/main_bloc.dart';
import 'package:shutterstock_scroll/pages/gallery/widgets/square_image.dart';


class GalleryList extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

        return ScopedModelDescendant<MainBloc>(
            rebuildOnChange: true,
            builder: (BuildContext context, Widget _, MainBloc model){

            List<ImageData>  _photoData = model.photoData;

            return _photoData != null ? SliverGrid(
                key: UniqueKey(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    childAspectRatio: 1.0,
                ),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                            ImageData imageData = _photoData[index];
                            return  SquareImage(imageData);
                    },
                    childCount: _photoData.length
                )): SliverToBoxAdapter(child:Center(child: CircularProgressIndicator(),));

        });
    }
}
        
