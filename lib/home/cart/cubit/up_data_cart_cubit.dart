import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/home/cart/cubit/up_data_cart_state.dart';

class UpDataCartCubit extends Cubit<UpDataCartState> {
  UpDataCartCubit() : super(UpDataCartState());

  int count = 1;
  Timer? _debounce;

  Future<void> _cartUpDataProduct({
    required int productId,
    required int amount,
  }) async {
    try {
      final formData = FormData.fromMap({'amount': amount});

      final response = await DioHelper.putData(
        endPoint: 'client/cart/$productId',
        data: formData,
      );
      if (response.isSucces) {
        emit(UpDataCartSuccessState());
      }
    } on DioException catch (e) {
      emit(UpDataCartFailureState());
    }
  }

  void increaseCount({required int id}) {
    count++;
    emit(IncreaseCount());
    upDataCart(productId: id, amount: count);
  }

  void decreaseCount({required int id}) {
    if (count > 0) {
      count--;
    }

    emit(DecreaseCount());
    upDataCart(productId: id, amount: count);
  }

  Future<void> upDataCart({
    required int productId,
    required int amount,
  }) async {
    _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () {
      _cartUpDataProduct(productId: productId, amount: amount);
    });
  }
}
