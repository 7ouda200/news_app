import 'package:flutter/cupertino.dart';
import 'package:news_app/API_Manger.dart';
import 'package:news_app/models/data_model_api/getNews_api.dart';
import 'package:news_app/models/data_source/News_data_source.dart';
import 'package:news_app/models/serviceLocator.dart';
import 'package:news_app/reposirity/NewsRepo.dart';
import '../models/News_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'getNews_state.dart';

class NewsModelView extends Cubit<NewsState> {
  late newsRepo repo;
  NewsModelView() : super(NewsIntial()) {
    repo = newsRepo(ServiceLocator.dataSource2);
  }

  Future<void> getnews(String SourceId) async {
    emit(GetnewsLoading());
    try {
      // final response = await news_api.getNews(SourceId);

      final news = await repo.getNews(SourceId);
      emit(GetnewsSuccess(news));
    } catch (error) {
      emit(GetnewsError(error.toString()));
    }
  }
}

// class NewsModelView with ChangeNotifier {
//   late newsRepo repo;
//
//   NewsModelView(){
//     repo=newsRepo(ServiceLocator.dataSource2);
//   }
//
//   getnews_api news_api=getnews_api();
//   List<Articles> news = [];
//   bool isloading = false;
//   String? errorMessage;
//
//   Future<void> getnews(String SourceId) async {
//     isloading = true;
//     notifyListeners();
//     try {
//      // final response = await news_api.getNews(SourceId);
//
//         news =await repo.getNews(SourceId);
//
//     } catch (error) {
//       errorMessage = error.toString();
//     }
//     isloading = false;
//     notifyListeners();
//   }
// }
