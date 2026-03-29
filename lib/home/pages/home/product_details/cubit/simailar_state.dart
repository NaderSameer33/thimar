import '../../products/model/product_model.dart';

class SimailarState {}

class SimailarLoadingState extends SimailarState {}

class SimailarSuccessState extends SimailarState {
  final List<ProductModel> products;

  SimailarSuccessState({required this.products});
}

class SimilarFailureState extends SimailarState {
  final String errorMessage;
  SimilarFailureState({required this.errorMessage});
}
