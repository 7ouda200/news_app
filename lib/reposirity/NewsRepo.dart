

import '../models/News_model.dart';
import '../models/data_source/News_data_source.dart';

class newsRepo {
final newsDatasource data_source;
newsRepo(this.data_source);

Future<List<Articles>> getNews(String SourceId) async {
  return await data_source.getNews(SourceId);
}
}