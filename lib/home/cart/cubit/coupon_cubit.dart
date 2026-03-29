import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/home/cart/cubit/coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  CouponCubit() : super(CouponState());

  Future<void> applyCartCoupon({required String couponCode}) async {
    emit(CouponLoadingState());
    final formData = FormData.fromMap({'code': couponCode});

    try {
      final response = await DioHelper.sendData(
        endPoint: 'client/cart/apply_coupon',
        data: formData,
      );
      if (!isClosed) {
        emit(CouponSuccessState(succesMessage: response.succesMessage ?? ''));
      }
    } on DioException catch (e) {
      emit(CouponFailureState(errorMessage: e.response!.data['message']));
    }
  }
}
