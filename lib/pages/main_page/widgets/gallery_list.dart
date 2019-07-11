import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shutterstock_scroll/classes/image_data.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shutterstock_scroll/logic/main_model.dart';
import 'package:shutterstock_scroll/pages/main_page/widgets/square_image.dart';


class GalleryList extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

        return ScopedModelDescendant<MainModel>(
            rebuildOnChange: true,
            builder: (BuildContext context, Widget _, MainModel model){

            List<ImageData>  _photoData = model.photoData;
            bool showPhotos = _photoData != null && _photoData.length > 0;

            return showPhotos ? SliverGrid(
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
                            return SquareImage(imageData);
                    },
                    childCount: _photoData.length
                )): SliverToBoxAdapter(
                        child: Container(
                            height: MediaQuery.of(context).size.height, 
                            alignment: Alignment(0, 0),   
                            child: CircularProgressIndicator(),));
        });
    }
}
        
