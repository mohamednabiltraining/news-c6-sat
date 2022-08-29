import 'dart:convert';

import 'package:news_c6_sat/api/model/news_response.dart';
import 'package:news_c6_sat/api/model/sources_response.dart';
import 'package:http/http.dart' as http;

class ApiManager{
  static const String BASE_URL = 'newsapi.org';
  static const String API_KEY = '5909ae28122a471d8b0c237d5989cb73';

  static Future<SourcesResponse> getNewsSources(
      String category
      )async{
     // call api
     // parse data from json
     // return sources response
     var uri = Uri.https(BASE_URL, 'v2/top-headlines/sources',
     {'apiKey':API_KEY,
       'category':category},);

     var response = await http.get(uri);
       var json = jsonDecode(response.body);
       var sourcesResponse = SourcesResponse.fromJson(json);
       if(response.statusCode == 200){
         return sourcesResponse;
       }else {
         throw Exception(sourcesResponse.message);
       }
  }

  static Future<NewsResponse> getNews(String sourceId)async{
    var uri = Uri.https(BASE_URL, 'v2/everything',
    {'apiKey':API_KEY,'sources':sourceId});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}