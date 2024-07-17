import 'data_model_api/getNews_api.dart';
import 'data_model_api/getSources_api.dart';
import 'data_source/News_data_source.dart';
import 'data_source/source_data_source.dart';

class ServiceLocator{
  static sourceDatasource dataSource=getsource_Api();
  static newsDatasource dataSource2=getnews_api();





}