import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shutterstock_scroll/pages/gallery/gallery.dart';

import 'logic/main_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

    final MainBloc _model = MainBloc();

    @override
    Widget build(BuildContext context) {
        return ScopedModel(
            model: _model,
            child: new MaterialApp(
        title: 'Shutterstock Scroll',
        theme: ThemeData(
                primarySwatch: Colors.red,
            ),
        home: Gallery()
        )
        );
    }
}
