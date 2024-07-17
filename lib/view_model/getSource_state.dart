import '../models/source.dart';

abstract class SourcesState {}

class SourceIntial extends SourcesState {}

class GetsourceLoading extends SourcesState {}

class GetsourceSuccess extends SourcesState {
  final List<Sources> sources;
  GetsourceSuccess(this.sources);
}

class GetsourceError extends SourcesState {
  final String messege;
  GetsourceError(this.messege);
}
