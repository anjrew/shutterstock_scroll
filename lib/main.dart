import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shutterstock_scroll/pages/main_page/main_page.dart';
import 'package:flutter_driver/driver_extension.dart';


import 'logic/main_model.dart';

void main() {

    dataHandler(String msg) async {}
    enableFlutterDriverExtension(handler: dataHandler);
    runApp(App());
} 
class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

    final Client httpClient = new Client(); 
    MainModel _model;

    @override
    void initState() {
        super.initState();
        _model = MainModel(httpClient: httpClient);
    }

    @override
    Widget build(BuildContext context) {
        return ScopedModel(
            
            model: _model,
            child: new MaterialApp(
                title: 'Shutterstock Scroll',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                        primarySwatch: Colors.red,
                    ),
                home: MainPage()
            )
        );
    }
}
