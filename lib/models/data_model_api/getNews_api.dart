import '../News_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data_source/News_data_source.dart';
class getnews_api extends newsDatasource{

  Future<List<Articles>> getNews(String sourceid)async{
    try{
      final uri=Uri.https('newsapi.org','/v2/top-headlines',
          {
            'apiKey':'3f052e9e427a4ec39293b751332b5ff0','sources':sourceid
          }
      );

      final response=await http.get(uri);
      final json=jsonDecode(response.body);
      final  News_response=News.fromJson(json);
      if(News_response.status=='ok'&& News_response.articles!=null){
        return News_response.articles!;
      }else{
        throw Expando('faild to get soources');
      }
    }catch(e){
      print(e);
      rethrow;
    }
  }



}