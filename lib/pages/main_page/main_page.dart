import 'package:flutter/material.dart';
import 'package:shutterstock_scroll/logic/main_model.dart';
import 'package:shutterstock_scroll/pages/main_page/widgets/app_bar.dart';
import 'package:shutterstock_scroll/pages/main_page/widgets/gallery_list.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

     ScrollController _controller = new ScrollController();

    @override
    void initState() {
        super.initState();
        _controller.addListener(handleScroll);
    }

    @override
    Widget build(BuildContext context) {
        MainModel logic = MainModel.of(context);
        return Scaffold(
            body: CustomScrollView(
                controller: _controller,
                slivers: <Widget>[

                    GalleryAppBar(),

                    logic.error != null ? ErrorWidget(logic.error) : GalleryList(),

                ]
            )
        );
    }
    
    void handleScroll(){
        double position = _controller.position.pixels;
        double maxExtent = _controller.position.maxScrollExtent;
        if (position >= maxExtent){
            MainModel.of(context).getMoreImages();
        }
    }

    @override
    void dispose() {
        _controller.dispose();
        super.dispose();
    }
}