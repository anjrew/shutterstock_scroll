import 'package:flutter/material.dart';
import 'package:shutterstock_scroll/logic/main_bloc.dart';
import 'package:shutterstock_scroll/pages/gallery/widgets/app_bar.dart';
import 'package:shutterstock_scroll/pages/gallery/widgets/gallery_list.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

     ScrollController _controller = new ScrollController();

    @override
    void initState() {
        super.initState();
        _controller.addListener(handleScroll);
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: CustomScrollView(
                controller: _controller,
                slivers: <Widget>[

                    GalleryAppBar(),

                    GalleryList()

                ]
            )
        );
    }
    
    void handleScroll(){
        double position = _controller.position.pixels;
        double maxExtent = _controller.position.maxScrollExtent;
        if (position >= maxExtent){
            MainBloc.of(context).getMoreImages();
        }
    }

    @override
    void dispose() {
        _controller.dispose();
        super.dispose();
    }
}