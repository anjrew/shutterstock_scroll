import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shutterstock_scroll/logic/main_model.dart';
import 'package:shutterstock_scroll/pages/main_page/widgets/main_app_bar.dart';
import 'package:shutterstock_scroll/pages/main_page/widgets/gallery_list.dart';
import 'package:shutterstock_scroll/widgets/error_widget/error_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    MainModel.of(context)
      ..connectionStateStream.listen(showConnectionStatus)
      ..errorStream.listen(showError);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        rebuildOnChange: true,
        builder: (BuildContext scopedContext, Widget _, MainModel logic) {
          return Scaffold(
              body: CustomScrollView(
            controller: _controller,
            slivers: <Widget>[
              MainAppBar(),
              GalleryList(),
              SliverToBoxAdapter(
                  child: logic.requesting == true
                      ? LinearProgressIndicator()
                      : Container()),
            ],
          ));
        });
  }

  void showError(dynamic error) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => ErrorMessageWidget(
          message: error.toString(), okAction: removeErrorDiolog),
    );
  }

  void removeErrorDiolog() {
    MainModel.of(context).getMoreImages();
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  void showConnectionStatus(String status) {
    Fluttertoast.showToast(
        msg: status,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
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
