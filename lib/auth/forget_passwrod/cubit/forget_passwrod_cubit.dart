import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'forget_passwrod_state.dart';
import '../../../core/logic/dio_helper.dart';

class ForgetPasswrodCubit extends Cubit<ForgetPasswrodState> {
  ForgetPasswrodCubit() : super(ForgetpassIntinalState());
  final phoneController = TextEditingController();

  Future<void> forgetPasswrod() async {
    emit(ForgetpassLoadingState());
    final formData = FormData.fromMap({
      'phone': phoneController.text.trim(),
    });

    try {
      final response = await DioHelper.sendData(
        endPoint: 'forget_password',
        data: formData,
      );
      emit(
        ForgetpassSuccessState(
          succesMessage: response.succesMessage ?? '',
        ),
      );
    } on DioException catch (exception) {
      emit(
        ForgetpassFailureState(
          errorMessage:
              exception.response?.data['message'] ??
              'حدث خطا كا يرجي المحاوله لاحقا ',
        ),
      );
    }
  }
}
