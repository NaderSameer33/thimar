import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'otp_state.dart';
import '../../../core/logic/dio_helper.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpIntinalState());

  Future<void> verfiyOtp({
    required String code,
    required String phoneNumber,
  }) async {
    emit(OtpLoadinState());
    final formData = FormData.fromMap({
      'phone': phoneNumber,
      'code': code,
      'device_token': 'test',
      'type': 'ios',
    });
    final response = await DioHelper.sendData(
      endPoint: 'verify',
      data: formData,
    );

    if (response.isSucces) {
      emit(
        OtpSuccessState(
          succesMessage: response.succesMessage ?? 'تم تاكيد حسابك بنجاح',
        ),
      );
    } else {
      emit(
        OtpFailureState(
          failureMessage: response.exception ?? 'حدث خطا ما يرجي المحاوله لاحقا',
        ),
      );
    }
  }

  // // todo   complete it in later time
  // Future<void> checkCode({required String code, required String phone}) async {
  //   final formData = FormData.fromMap({
  //     'phone': phone,
  //     'code': code,
  //   });
  //   try {
  //     final response = await DioHelper.sendData(
  //       endPoint: 'check_code',
  //       data: formData,
  //     );
  //     emit(
  //       CheckCodeSuccess(
  //         succesMessage: response.succesMessage!,
  //         isActive: response.data['is_active'] == true,
  //       ),
  //     );
  //   } on DioException catch (exception) {
  //     emit(
  //       CheckCodeFailure(failureMessage: exception.response!.data['message']),
  //     );
  //   }
  // }
}
