import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';
import '../models/login_model.dart';
import '../../../core/logic/cache_helper.dart';
import '../../../core/logic/dio_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginIntinalState());

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginUser() async {
    emit(LoginLoadingState());
    final formData = FormData.fromMap({
      'phone': phoneController.text.trim(),
      'password': passwordController.text.trim(),
      'device_token': 'test',
      'type': 'ios',
      'user_type': 'client',
    });
    try {
      final response = await DioHelper.sendData(
        endPoint: 'login',
        data: formData,
      );

      final model = LoginData.fromJson(response.data).loginModel;
      CacheHelper.saveUser(model: model);

      emit(
        LoginSuccessState(
          succesMessage: response.succesMessage ?? 'تم تسجيل الدخول بنجاح',
        ),
      );
    } on DioException catch (exception) {
      emit(
        LoginFailureState(
          errorMessage:
              exception.response?.data['message'] ??
              'حدث خطا ما يرجي المحاوله لاحقا',
        ),
      );
    }
  }
}
