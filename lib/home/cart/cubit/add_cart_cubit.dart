import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/logic/dio_helper.dart';
import 'add_cart_state.dart';

class AddCartCubit extends Cubit<AddCartState> {
  AddCartCubit() : super(AddCartState());

  Future<void> addCartProduct({
    required int productId,
    int amount = 1,
  }) async {
    emit(AddCartLoadingState(id:  productId));
    final formData = FormData.fromMap({
      'product_id': productId,
      'amount': amount,
    });
    try {
      final response = await DioHelper.sendData(
        endPoint: 'client/cart',
        data: formData,
      );
      if (response.isSucces) {
        final succesMessage = response.data['message'];

        emit(AddCartSuccessState(succesMessage: succesMessage, id: productId));
      }
    } on DioException catch (e) {
      emit(AddCartFailureState(errorMessage: e.toString()));
    }
  }
}
