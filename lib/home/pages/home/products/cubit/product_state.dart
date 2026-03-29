import '../model/product_model.dart';

class ProductState {}

class ProdcutLoadingState extends ProductState {}

class ProdcutSuccessState extends ProductState {
  final List<ProductModel> list;
  ProdcutSuccessState({required this.list});
}

class ProdcutFailureState extends ProductState {
  final String errorMessage;
  ProdcutFailureState({required this.errorMessage});
}
