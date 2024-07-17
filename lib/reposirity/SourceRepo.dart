import '../models/data_model_api/getSources_api.dart';
import '../models/data_source/source_data_source.dart';
import '../models/source.dart';

class sourceRepo {
  final sourceDatasource data_source;
  sourceRepo(this.data_source);

  Future<List<Sources>> getsources(String category) async {
    return await data_source.getSources(category);
  }
}
