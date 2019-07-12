import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart';
import 'package:shutterstock_scroll/classes/image_data.dart';
import 'dart:convert';

class MainModel extends Model {

    List<ImageData> photoData = new List<ImageData>();
    int pageNumber = 1;
    String error;
    Client httpClient;
    bool requesting = false;
    
    MainModel({@required this.httpClient}){

        getImages(pageNumber)
            .then((result) {  
                photoData = result;
                notifyListeners();
            })
            .timeout(Duration(seconds: 10))
            .catchError((e) { 
                displayError(e);
            });
            
    }

    Future<List<ImageData>> getImages(int page)async{

        var result;
        if (!requesting){
            requesting = true;

            try {
                String ssClientId = "51edc-bf697-a8382-7b9fa-91743-1d438";
                String ssConsumerSecret = "a4396-09320-26310-71351-cf3ed-981bf";
                String credentials = "$ssClientId:$ssConsumerSecret";
                String encodedCredentials = base64.encode(utf8.encode(credentials));
                String authString = 'Basic $encodedCredentials';
                String amountPerPage = 'per_page=${10}';
                String pageNumberQuery = "page=$page";
                String uri = 'https://api.shutterstock.com/v2/images/search?$amountPerPage&&$pageNumberQuery';

                Response response = await httpClient.get(uri, headers: { 'Authorization' :  authString });

                if (response.statusCode == 200){
                    Map<String,dynamic> responseData = jsonDecode(response.body);
                    if (responseData["data"] != null){
                        result = resToImageData(responseData["data"]);
                        pageNumber++;
                        requesting = false;
                    } else {
                        throw Exception("The respose data was null");
                    }
                } else {
                    throw Exception('The GET request failed with code ${response.statusCode}');
                }
            } catch (e) {
                displayError(e);
            }
        }
        return result ?? List<ImageData>();
    }

    void getMoreImages()async{
        try {
            photoData.addAll(await getImages(pageNumber).timeout(Duration(seconds: 10)));
            notifyListeners();
        } catch (e) {
            displayError(e);
        }
    }

    List<ImageData> resToImageData(List<dynamic> data){
        return data.map((dynamic imageData) => new ImageData(
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

    void removeError()async{
        error = null;
        notifyListeners();
        try {
            photoData.addAll(await getImages(pageNumber).timeout(Duration(seconds: 10)));
            notifyListeners();
        } catch (e) {
            displayError(e);
        }
    }
    
    static MainModel of(BuildContext context) => ScopedModel.of<MainModel>(context);
}