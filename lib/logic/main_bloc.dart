import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shutterstock_scroll/classes/image_data.dart';
import 'dart:convert';

class MainBloc extends Model {

    List<ImageData> photoData;
    
    MainBloc(){
        getimages()
            .then((result) {  
                photoData = result;
                notifyListeners();
            })
            .catchError((e) => print(e));
    }

    Future<dynamic> getimages()async{
        var result;
        try {
            String ssClientId = "51edc-bf697-a8382-7b9fa-91743-1d438";
            String ssConsumerSecret = "a4396-09320-26310-71351-cf3ed-981bf";
            String credentials = "$ssClientId:$ssConsumerSecret";
            String encodedCredentials = base64.encode(utf8.encode(credentials));
            String authString = 'Basic $encodedCredentials';
            Response response = await http.get('https://api.shutterstock.com/v2/images/search',
            headers: { 'Authorization' :  authString });
            if (response.statusCode == 200){
                Map<String,dynamic> responseData = jsonDecode(response.body);
                result = resToImageData(responseData["data"]);
            } else {
                throw Exception('The GET request failed with code ${response.statusCode}');
            }
        } catch (e) {
            print(e);
        }
        return result;
    }

    List<ImageData> resToImageData(List<dynamic> data){
        return data.map((dynamic imageData)=> new ImageData(
                url: imageData['assets']['huge_thumb']['url'],
                description: imageData['description'],
                id: imageData['id']
            )
        ).toList();
    }
    
    static MainBloc of(BuildContext context) => ScopedModel.of<MainBloc>(context);
}