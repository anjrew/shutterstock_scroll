import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart';
import 'package:shutterstock_scroll/classes/image_data.dart';
import 'dart:convert';

class MainModel extends Model {

    Client client = Client();

    List<ImageData> photoData;
    int pageNumber = 1;
    String error;
    
    MainModel(){
        getimages(pageNumber)
            .then((result) {  
                photoData = result;
                notifyListeners();
            })
            .catchError((e) { 
                displayError(e);
            });
    }

    Future<dynamic> getimages(page)async{
        var result;
        try {
            String ssClientId = "51edc-bf697-a8382-7b9fa-91743-1d438";
            String ssConsumerSecret = "a4396-09320-26310-71351-cf3ed-981bf";
            String credentials = "$ssClientId:$ssConsumerSecret";
            String encodedCredentials = base64.encode(utf8.encode(credentials));
            String authString = 'Basic $encodedCredentials';
            String amountPerPage = 'per_page=${10}';
            String pageNumberQuery = "page=$page";
            String uri = 'https://api.shutterstock.com/v2/images/search?$amountPerPage&&$pageNumberQuery';
            Response response = await client.get(uri, headers: { 'Authorization' :  authString })
                .timeout(Duration(seconds: 10));

            if (response.statusCode == 200){
                Map<String,dynamic> responseData = jsonDecode(response.body);
                if (responseData["data"] != null){
                    result = resToImageData(responseData["data"]);
                    pageNumber++;
                } else {
                    throw Exception("The respose data was null");
                }
            } else {
                throw Exception('The GET request failed with code ${response.statusCode}');
            }
        } catch (e) {
            displayError(e);
        }
        return result;
    }

    void getMoreImages()async{
        try {
            photoData.addAll(await getimages(pageNumber));
            notifyListeners();
        } catch (e) {
            displayError(e);
        }
    }

    List<ImageData> resToImageData(List<dynamic> data){

        return data.map((dynamic imageData)=> new ImageData(
                url: imageData['assets']['huge_thumb']['url'],
                description: imageData['description'],
                id: imageData['id']
            )
        ).toList();
    }

    void displayError(e){
        this.error = e.toString();
        notifyListeners();
        print(e);
    }
    
    static MainModel of(BuildContext context) => ScopedModel.of<MainModel>(context);
}