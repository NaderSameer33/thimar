import '../models/categories.dart';

class CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}


class CategoriesSuccessState extends CategoriesState {
  final List <CategoriesModel> list ; 
  CategoriesSuccessState({required this.list}); 

}

class CategoriesFailureState extends CategoriesState {
  final String errorMessage ; 
  CategoriesFailureState({required this.errorMessage}) ; 
}
