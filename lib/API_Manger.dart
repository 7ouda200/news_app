import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/source.dart';

import 'models/News_model.dart';

class API{

 // Future<sources> getSources(String category)async{
 //   try{
 //     final uri=Uri.https('newsapi.org','/v2/top-headlines/sources',
 //         {
 //           'apiKey':'3f052e9e427a4ec39293b751332b5ff0','category':category
 //         }
 //     );
 //
 //     final response=await http.get(uri);
 //     final json=jsonDecode(response.body);
 //     return sources.fromJson(json);
 //   }catch(e){
 //     print(e);
 //     rethrow;
 //   }
 //  }


 // Future<News> getNews(String sourceid)async{
 //   try{
 //     final uri=Uri.https('newsapi.org','/v2/top-headlines',
 //         {
 //           'apiKey':'3f052e9e427a4ec39293b751332b5ff0','sources':sourceid
 //         }
 //     );
 //
 //     final response=await http.get(uri);
 //     final json=jsonDecode(response.body);
 //     return News.fromJson(json);
 //   }catch(e){
 //     print(e);
 //     rethrow;
 //   }
 // }

 Future<News> search(String searchid)async{
   try{
     final uri=Uri.https('newsapi.org','/v2/everything',
         {
           'apiKey':'3f052e9e427a4ec39293b751332b5ff0','q':searchid
         }
     );

     final response=await http.get(uri);
     final json=jsonDecode(response.body);
     return News.fromJson(json);
   }catch(e){
     print(e);
     rethrow;
   }
 }


}