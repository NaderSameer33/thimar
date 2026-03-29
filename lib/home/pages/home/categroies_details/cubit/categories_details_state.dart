import '../../products/model/product_model.dart';

class CategoriesDetailsState {}

class CategoriesDetailsLoadingState extends CategoriesDetailsState {}

class CategoriesDetailsSuccessState extends CategoriesDetailsState {
  final List <ProductModel> list ;   
  CategoriesDetailsSuccessState({required this.list}) ; 
}

class CategoriesDetailsFailureState extends CategoriesDetailsState {
  final String errorMessage ; 
  CategoriesDetailsFailureState({required this.errorMessage}); 
}
