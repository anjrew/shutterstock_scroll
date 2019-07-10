import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shutterstock_scroll/logic/main_model.dart';
import 'package:shutterstock_scroll/pages/main_page/widgets/main_app_bar.dart';
import 'package:shutterstock_scroll/pages/main_page/widgets/gallery_list.dart';
import 'package:shutterstock_scroll/widgets/error_widget/error_widget.dart';

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
        return ScopedModelDescendant<MainModel>(
            rebuildOnChange: true,
            builder: (BuildContext context, Widget _, MainModel logic) {
            return Scaffold(
                body: CustomScrollView(
                    controller: _controller, 
                    slivers: <Widget>[

                        MainAppBar(),

                        logic.error != null
                            ? ErrorMessageWidget(
                                    message: logic.error,
                                    okAction: ()=> setState(() => logic.error = null))
                            : GalleryList(),

                        SliverToBoxAdapter(child: logic.requesting ? LinearProgressIndicator() : Container())

                    ]));
            });
    }

    void handleScroll() {
        double position = _controller.position.pixels;
        double maxExtent = _controller.position.maxScrollExtent;
        if (position >= maxExtent && MainModel.of(context).photoData != null) {
            MainModel.of(context).getMoreImages();
        }
    }

    @override
    void dispose() {
        _controller.dispose();
        super.dispose();
    }
}
