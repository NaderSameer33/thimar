import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_state.dart';
import '../../../core/logic/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(IntinalState());
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswrodController = TextEditingController();
  final phoneController = TextEditingController();

  Future<void> clientRegister() async {
    emit(LoadingState());
    final formData = FormData.fromMap({
      'fullname': nameController.text.trim(),
      'password': passwordController.text.trim(),
      'password_confirmation': confirmPasswrodController.text.trim(),
      'phone': phoneController.text.trim(),
    });
    try {
      final response = await DioHelper.sendData(
        endPoint: 'client_register',
        data: formData,
      );
      emit(
        SuccessState(succesMessage: response.succesMessage ?? ''),
      );
    } on DioException catch (exception) {
      emit(
        FaliureState(
          errorMessage: exception.response!.data['message'],
        ),
      );
    }
  }
}
