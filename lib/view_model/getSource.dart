import 'package:flutter/cupertino.dart';
import 'package:news_app/API_Manger.dart';
import 'package:news_app/models/serviceLocator.dart';
import '../models/data_model_api/getSources_api.dart';
import '../models/data_source/source_data_source.dart';
import '../models/source.dart';
import '../reposirity/SourceRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'getSource_state.dart';

class SourceModelView extends Cubit<SourcesState> {
  late sourceRepo repository;
  SourceModelView() : super(SourceIntial()) {
    this.repository = sourceRepo(ServiceLocator.dataSource);
  }

  Future<void> getsources(String categoryId) async {
    emit(GetsourceLoading());
    try {
      // final response = await source_api.getSources(categoryId);
      final sources = await repository.getsources(categoryId);
      emit(GetsourceSuccess(sources));
    } catch (error) {
      emit(GetsourceError(error.toString()));
    }
  }
}

// class SourceModelView with ChangeNotifier {
//   late sourceRepo repository;
//   SourceModelView() {
//     this.repository = sourceRepo(ServiceLocator.dataSource);
//   }
//
//   List<Sources> sources = [];
//   bool isloading = false;
//   String? errorMessage;
//
//   Future<void> getsources(String categoryId) async {
//     isloading = true;
//     notifyListeners();
//     try {
//      // final response = await source_api.getSources(categoryId);
//       sources=await repository.getsources(categoryId);
//     } catch (error) {
//       errorMessage = error.toString();
//     }
//     isloading = false;
//     notifyListeners();
//   }
// }
