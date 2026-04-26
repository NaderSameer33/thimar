import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/home/cart/cubit/up_data_cart_state.dart';

class UpDataCartCubit extends Cubit<UpDataCartState> {
  UpDataCartCubit() : super(UpDataCartState());

  Future<void> updateCart({required int id, required int amount}) async {
    emit(UpDataCartLoadingState());
    
    final formData = FormData.fromMap({
      'amount': amount,
    });

    final response = await DioHelper.putData(
      endPoint: 'client/cart/$id',
      data: formData,
    );

    if (isClosed) return;

    if (response.isSucces) {
      emit(UpDataCartSuccessState(succesMessage: response.succesMessage ?? 'تم تحديث السلة بنجاح'));
    } else {
      emit(UpDataCartFailureState(errorMessage: response.exception ?? 'حدث خطأ ما'));
    }
  }
}
