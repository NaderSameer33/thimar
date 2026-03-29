


import '../../home/products/model/product_model.dart';

class FavouriteProductState {}

class  FavouriteProductLoadingState extends FavouriteProductState{}
class FavouriteProductSuccessState extends FavouriteProductState { 
  final List<ProductModel> favouriteProduct ;

  FavouriteProductSuccessState({required this.favouriteProduct}) ; 

}
class   FavouriteProductFailureState extends FavouriteProductState { 
  final String errorMessage ;
  FavouriteProductFailureState({required this.errorMessage}); 
}