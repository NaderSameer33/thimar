import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/home/cart/cubit/cart_product_state.dart';
import 'package:thimar/home/cart/model/cart_model.dart';

class CartProductCubit extends Cubit<CartProductState> {
  CartProductCubit() : super(CartProductState());

  late List<CartModel> list;

  Future<void> getCartProduct() async {
    emit(CartProductLoadingState());
    try {
      final response = await DioHelper.getData(endPoint: 'client/cart');
      if (response.isSucces) {
        list = CartData.fromjson(response.data).list;

        if (!isClosed) {
          emit(CartProductSuccessState(list: list));
        }
      }
    } on DioException catch (e) {
      emit(
        CartProductFailureState(errorMessage: e.toString()),
      );
    }
  }
}
