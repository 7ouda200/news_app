

import '../News_model.dart';

abstract class newsDatasource{
  Future<List<Articles>> getNews(String SourceId);

}