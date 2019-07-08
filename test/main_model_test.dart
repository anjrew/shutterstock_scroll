import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:matcher/matcher.dart';
import 'package:shutterstock_scroll/classes/image_data.dart';
import 'package:shutterstock_scroll/logic/main_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

// import 'package:http/http.dart';

class MockHttp extends Mock implements http.Client {}


void main()async{
    final model = MainModel();
    http.Client mockHttp = MockClient((Request request) =>  Future.value(Response('''
                {
                "data": [
                    {
                        "url": "http://saohiazo.jp/mup",
                        "description": "Ace nibnofrik hin ita afcaz zez mub lew dudotep ekitoco tamnij oj jezesi kujut kawzikuf ukrigrej lunefub jeom. Mazojatu so ak fahzilic pozus emenu rudhuv olarih wewapga nukve hapus wocat la sup wospefah. Tu binas zecucko ah unpelmih vevbej vubuoro wi ka wikin betores momkelbi. Souwva jura oziforho pame kewzejtu ja huju lon mes zegag nocpobez huka. Uvtukfab zughozeh iniwudni fu uzewes hitdutzob sijo kosij afe vauru ozgibpos rurwac morja licbavze gurwatwev. We dofra rohotuz kag vet kefga hih hifesuh higejnet nokjob joupo zaw finusiw doge vi opiahuec.",
                        "id": 257290
                    },
                    {
                        "url": "http://gekomim.rs/imuesewe",
                        "description": "Wuvmibdaj widiru hiz hiod vocbelbo ow ude ne izejueto ifpe od de. Edijulse menafmov api cat omoji vortieri lovo lekulhi feno ton ekelob dij womkorut zooka nosdauj si isve. Ca hulza ud cek tuh vuf ik viujiha suurucof heihail uhebaut zuzoso buliwru ga evile mujjegho. Po ijikarep kehesegi wem veno vompefi ilfoov gugileb hikafrur fu imsocfut efte zinhin. Ajeojjaj muod cutriv mikvo waknobzil gamahfem colpeabu ceb azi guepjo ufdel wuzin su vofsuna ficsot wiluwa we lirujri.",
                        "id": 973416
                    },
                    {
                        "url": "http://fesiloh.ci/ebu",
                        "description": "Je ju la puoza gijuud nuldardus oluvolte foca oceri zihbe odico budew ecfomzul ta lonehda. Verkagoj ok gozog ulakibi fopo zunfutzi erja barepedi sa wecuk bap wafagul cazir obalihsa potedlor senu pi wu. Ure unireun wakjew mo ed sijgetup zevvukde dili tazmefas ohoulo adioz ezkoona zo ardagori bapokalo tufronag luvtifte. Zowdeplor hadtim zuraca pemok fucveni docnizga vatudinig heebeho dargij urudahil juh edsorwih najoz ihaipaaku wo nabwimpo tepnew curuthu. Babdem ba orewu odji kesbal itdin tufmum nahca soje gidjudur dudki imozina uho pac. Lak dipzabfak vuw ahugeput asmup ebrukwip rumo ivegemom rinetdus tif pe pawzab beveb jowlenhu tija fecovoeba zazve zo.",
                        "id": 160790
                    }
                ]
            }
            ''', 
                200)));
    model.client = mockHttp;

    test('Counter value should be incremented', () {
        expect(model.pageNumber, 1);
    });

    test('Get more images increments', () async {

        // Intermittently working
        // final mockDataFile = new File('test/mock_data/shutterstock_images_mock_data.json');
        // final jsonData = json.decode(await mockDataFile.readAsString());

        // when(mockHttp.get(argThat(startsWith('https://api.shutterstock.com/v2/images/search?per_page=10&&page=1'))))
        //         .thenAnswer((_) => Future.value(Response(jsonData, 200)));

           
            when(mockHttp.get('https://api.shutterstock.com/v2/images/search?per_page=10&&page=1'))
                .thenAnswer((_) => Future.value(Response('''
                {
                "data": [
                    {
                        "url": "http://saohiazo.jp/mup",
                        "description": "Ace nibnofrik hin ita afcaz zez mub lew dudotep ekitoco tamnij oj jezesi kujut kawzikuf ukrigrej lunefub jeom. Mazojatu so ak fahzilic pozus emenu rudhuv olarih wewapga nukve hapus wocat la sup wospefah. Tu binas zecucko ah unpelmih vevbej vubuoro wi ka wikin betores momkelbi. Souwva jura oziforho pame kewzejtu ja huju lon mes zegag nocpobez huka. Uvtukfab zughozeh iniwudni fu uzewes hitdutzob sijo kosij afe vauru ozgibpos rurwac morja licbavze gurwatwev. We dofra rohotuz kag vet kefga hih hifesuh higejnet nokjob joupo zaw finusiw doge vi opiahuec.",
                        "id": 257290
                    },
                    {
                        "url": "http://gekomim.rs/imuesewe",
                        "description": "Wuvmibdaj widiru hiz hiod vocbelbo ow ude ne izejueto ifpe od de. Edijulse menafmov api cat omoji vortieri lovo lekulhi feno ton ekelob dij womkorut zooka nosdauj si isve. Ca hulza ud cek tuh vuf ik viujiha suurucof heihail uhebaut zuzoso buliwru ga evile mujjegho. Po ijikarep kehesegi wem veno vompefi ilfoov gugileb hikafrur fu imsocfut efte zinhin. Ajeojjaj muod cutriv mikvo waknobzil gamahfem colpeabu ceb azi guepjo ufdel wuzin su vofsuna ficsot wiluwa we lirujri.",
                        "id": 973416
                    },
                    {
                        "url": "http://fesiloh.ci/ebu",
                        "description": "Je ju la puoza gijuud nuldardus oluvolte foca oceri zihbe odico budew ecfomzul ta lonehda. Verkagoj ok gozog ulakibi fopo zunfutzi erja barepedi sa wecuk bap wafagul cazir obalihsa potedlor senu pi wu. Ure unireun wakjew mo ed sijgetup zevvukde dili tazmefas ohoulo adioz ezkoona zo ardagori bapokalo tufronag luvtifte. Zowdeplor hadtim zuraca pemok fucveni docnizga vatudinig heebeho dargij urudahil juh edsorwih najoz ihaipaaku wo nabwimpo tepnew curuthu. Babdem ba orewu odji kesbal itdin tufmum nahca soje gidjudur dudki imozina uho pac. Lak dipzabfak vuw ahugeput asmup ebrukwip rumo ivegemom rinetdus tif pe pawzab beveb jowlenhu tija fecovoeba zazve zo.",
                        "id": 160790
                    }
                ]
            }
            ''', 
                200))
            );

        var mockedResult = await model.getimages(1);

        expect(mockedResult[0], new TypeMatcher<ImageData>()
            .having((ImageData data) => data.id, 'id', equals(257290))
            .having((ImageData data) => data.url, 'url', equals("http://saohiazo.jp/mup"))
            .having((ImageData data) => data.description, 'description', equals("Ace nibnofrik hin ita afcaz zez mub lew dudotep ekitoco tamnij oj jezesi kujut kawzikuf ukrigrej lunefub jeom. Mazojatu so ak fahzilic pozus emenu rudhuv olarih wewapga nukve hapus wocat la sup wospefah. Tu binas zecucko ah unpelmih vevbej vubuoro wi ka wikin betores momkelbi. Souwva jura oziforho pame kewzejtu ja huju lon mes zegag nocpobez huka. Uvtukfab zughozeh iniwudni fu uzewes hitdutzob sijo kosij afe vauru ozgibpos rurwac morja licbavze gurwatwev. We dofra rohotuz kag vet kefga hih hifesuh higejnet nokjob joupo zaw finusiw doge vi opiahuec"))
        );
    });
}