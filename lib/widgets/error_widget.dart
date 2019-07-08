import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorMessageWidget extends StatelessWidget {

    final String message;
    final Function okAction;

    const ErrorMessageWidget({@required this.message, @required this.okAction});

    // @override
    // Widget build(BuildContext context) {
    //     return Container(
    //     child: Column(children: <Widget>[
    //         Text("Error"),
    //         Text(message),
    //         FlatButton(
    //             child: Text("Ok"),
    //             onPressed: () => Navigator.pop(context))
    //     ],),
    //     );
    // }

    @override
    Widget build(BuildContext context) {
        return AlertDialog(
            title: Text("Error"),
            titlePadding: EdgeInsets.all(20),
            content: Text(message),
            contentPadding: EdgeInsets.all(20),
            actions: <Widget>[ 
                MaterialButton(child: Text('OK'), 
                onPressed: okAction)
                ],
        );
    }
}