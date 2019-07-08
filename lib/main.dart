import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shutterstock_scroll/pages/main_page/main_page.dart';

import 'logic/main_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

    final MainModel _model = MainModel();

    @override
    Widget build(BuildContext context) {
        return ScopedModel(
            model: _model,
            child: new MaterialApp(
                title: 'Shutterstock Scroll',
                theme: ThemeData(
                        primarySwatch: Colors.red,
                    ),
                home: MainPage()
            )
        );
    }
}
