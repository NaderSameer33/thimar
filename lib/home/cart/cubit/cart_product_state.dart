import 'package:thimar/home/cart/model/cart_model.dart';

class CartProductState {}

class CartProductLoadingState extends CartProductState {}

class CartProductSuccessState extends CartProductState {
  final CartData cartData;
  CartProductSuccessState({
    required this.cartData,
  });
}

class CartProductFailureState extends CartProductState {
  final String errorMessage;
  CartProductFailureState({required this.errorMessage});
}
