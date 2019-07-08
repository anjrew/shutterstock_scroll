import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorWidget extends StatelessWidget {

    final String message;

    const ErrorWidget({@required this.message});

    @override
    Widget build(BuildContext context) {
        return Container(
        child: Column(children: <Widget>[
            Text("Error"),
            Text(message),
            FlatButton(
                child: Text("Ok"),
                onPressed: () => Navigator.pop(context))
        ],),
        );
    }
}