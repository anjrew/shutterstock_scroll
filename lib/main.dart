import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shutterstock_scroll/pages/main_page/main_page.dart';
import 'logic/main_model.dart';

final Client realHttpClient = new Client(); 

void main() => runApp(App(httpClient: realHttpClient));

class App extends StatefulWidget {

    final Client httpClient;

    const App({ @required this.httpClient });

    _AppState createState() => _AppState();
}

class _AppState extends State<App> {

    MainModel _model;

    @override
    void initState() {
        super.initState();
        _model = MainModel(httpClient: widget.httpClient);
    }

    @override
    Widget build(BuildContext context) {
        return ScopedModel(
            model: _model,
            child: new MaterialApp(
				key: ValueKey('mainApp'),
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
