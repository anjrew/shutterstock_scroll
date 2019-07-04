import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shutterstock_scroll/utils/print.dart';
import 'dart:convert';


class MainBloc extends Model {

    Set<Map<String,dynamic>> photoData;
    String ssClientId = "51edc-bf697-a8382-7b9fa-91743-1d438";
    String ssConsumerSecret = "a4396-09320-26310-71351-cf3ed-981bf";

    MainBloc(){
        getimages();
    }

    Future<dynamic> getimages()async{
        var result;
        try {
            String credentials = "$ssClientId:$ssConsumerSecret";
            String encodedCredentials = base64.encode(utf8.encode(credentials));
            String authString = 'Basic $encodedCredentials';
            Response response = await http.get('https://api.shutterstock.com/v2/images/search',
            headers: { 'Authorization' :  authString });
            printInfo(response);
            print(response.body);
            Object responseData = jsonDecode(response.body);
            print(responseData);

            print(response.bodyBytes.buffer);
        } catch (e) {

        }
        return result;
    }
    static MainBloc of(BuildContext context) => ScopedModel.of<MainBloc>(context);
}