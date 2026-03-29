import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/home/cart/cubit/remove_cart_state.dart';

class RemoveCartCubit extends Cubit<RemoveCartState> {
  RemoveCartCubit() : super(RemoveCartState());
  Future<void> removeCartProduct({required int productId}) async {
    try {
      final response = await DioHelper.deleteData(
        endPoint: 'client/cart/delete_item/$productId',
      );
      if (response.isSucces) {
        emit(
          CartRemoveSuccesState(succesMessage: response.data['message'] , proudctId: productId),
        );
      }
    } on DioException catch (e) {
      emit(
        CartRemoveFailureState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
