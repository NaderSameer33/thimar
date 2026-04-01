import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/home/cart/cubit/cart_product_state.dart';
import 'package:thimar/home/cart/model/cart_model.dart';

class CartProductCubit extends Cubit<CartProductState> {
  CartProductCubit() : super(CartProductState());

  Future<void> getCartProduct() async {
    emit(CartProductLoadingState());
    try {
      final response = await DioHelper.getData(endPoint: 'client/cart');
      if (response.isSucces) {
        final cartData = CartData.fromjson(response.data);

        if (!isClosed) {
          emit(
            CartProductSuccessState(
              cartData: cartData,
            ),
          );
        }
      }
    } on DioException catch (e) {
      emit(
        CartProductFailureState(errorMessage: e.toString()),
      );
    }
  }


void deleteCartProduct({required int id, required CartData cartData}) {
  final cartList = [...cartData.list];

  cartList.removeWhere((item) => item.id == id);

  double totalPriceBeforeDicount = 0;
  double totalDiscont = 0;

  for (var item in cartList) {
    totalPriceBeforeDicount += item.amount * item.price;
    totalDiscont += item.amount * item.discount;
  }

  double totalAfterDiscount =
      (totalPriceBeforeDicount - totalDiscont).clamp(0, double.infinity);

  final vat = totalAfterDiscount * .14;
  final totalWithVat = totalAfterDiscount + vat;

  final upDataCartData = cartData.copyWith(
    list: cartList,
    totalPriceBeforeDiscount: totalPriceBeforeDicount,
    totalDiscount: totalDiscont,
    totalPriceWithVat: totalWithVat,
    vat: vat,
  );

  emit(CartProductSuccessState(cartData: upDataCartData));
}
}
