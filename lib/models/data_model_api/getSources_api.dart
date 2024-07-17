import '../data_source/source_data_source.dart';
import '../source.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class getsource_Api extends sourceDatasource {


  Future<List<Sources>> getSources(String category)async{
    try{
      final uri=Uri.https('newsapi.org','/v2/top-headlines/sources',
          {
            'apiKey':'3f052e9e427a4ec39293b751332b5ff0','category':category
          }
      );

      final response=await http.get(uri);
      final json=jsonDecode(response.body);
      final source_response= sources.fromJson(json);
      if(source_response.status=='ok'&& source_response.source!=null){
        return source_response.source!;
      }else{
        throw Expando('faild to get soources');
      }
    }catch(e){
      print(e);
      rethrow;
    }
  }





}