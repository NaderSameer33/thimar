import '../model/search_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<SearchModel> list;
  SearchSuccessState({required this.list});
}

class SearchFailureState extends SearchState {
  final String errorMessage;
  SearchFailureState({required this.errorMessage});
}
