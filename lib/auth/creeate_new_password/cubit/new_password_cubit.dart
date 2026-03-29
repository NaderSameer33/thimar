import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'new_password_state.dart';
import '../../../core/logic/dio_helper.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit() : super(NewPasswordIntinalState());
  final passwrodController = TextEditingController();

  Future<void> createNewPassword({
    required String phone,
    required String code,
  }) async {
    emit(NewPasswordLoadingState());

    final formData = FormData.fromMap({
      'password': passwrodController.text.trim(),
      'phone': phone,
      'code': code,
    });

    try {
      final response = await DioHelper.sendData(
        endPoint: 'reset_password',
        data: formData,
      );
      emit(
        NewPasswrodSuccessState(
          succesMessage: response.succesMessage ?? 'تم تغير الباسورد',
        ),
      );
    } on DioException catch (exception) {
      emit(exception.response!.data['message']);
    }
  }
}
