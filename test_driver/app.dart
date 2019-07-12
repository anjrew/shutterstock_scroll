import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:shutterstock_scroll/main.dart';
import 'package:shutterstock_scroll/mock/mock_client.dart';


void main() {
    enableFlutterDriverExtension();
    runApp(App(httpClient: mockHttp));
}