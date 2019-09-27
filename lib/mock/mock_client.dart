import 'package:http/testing.dart';
import 'package:http/http.dart';

Client mockHttp = MockClient((request) async {
  return Response('''
                  {
                    "data": [
                        {
                            "assets": { 
                                "huge_thumb" : { 
                                    "url": "http://saohiazo.jp/mup"
                                    }   
                                },
                            "description": "Ace nibnofrik hin c.",
                            "id": "257290"
                        },
                        {   
                            "assets": { 
                                "huge_thumb" : { 
                                        "url": "http://gekomim.rs/imuesewe"
                                    }   
                                },
                            "description": "Wuvmibdaj widiru.",
                            "id": "973416"
                        },
                        {   
                            "assets": { 
                                "huge_thumb" : { 
                                        "url": "http://fesiloh.ci/ebu"
                                    }   
                                },
                            "description": "Je ju la puoza gijuud.",
                            "id": "160790"
                        }
                    ]
                }
            ''', 200);
});
