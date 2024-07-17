import '../models/News_model.dart';

abstract class NewsState {}

class NewsIntial extends NewsState {}

class GetnewsLoading extends NewsState {}

class GetnewsSuccess extends NewsState {
  final List<Articles> news;
  GetnewsSuccess(this.news);
}

class GetnewsError extends NewsState {
  final String messege;
  GetnewsError(this.messege);
}
