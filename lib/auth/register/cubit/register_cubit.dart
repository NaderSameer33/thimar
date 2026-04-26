
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
  final cityController = TextEditingController();

  Future<void> clientRegister() async {
    emit(LoadingState());
    final formData = FormData.fromMap({
      'fullname': nameController.text.trim(),
      'password': passwordController.text.trim(),
      'password_confirmation': confirmPasswrodController.text.trim(),
      'phone': phoneController.text.trim(),
      'gender': 'female', // Default from Postman screenshot
      'lat': 250.0515,     // From Postman screenshot
      'lng': 290.45,      // From Postman screenshot
    });

    final response = await DioHelper.sendData(
      endPoint: 'client_register',
      data: formData,
    );

    if (response.isSucces) {
      emit(
        SuccessState(succesMessage: response.succesMessage ?? 'تم انشاء الحساب بنجاح'),
      );
    } else {
      emit(
        FaliureState(
          errorMessage: response.exception ?? 'حدث خطا ما يرجي المحاوله لاحقا',
        ),
      );
    }
  }
  @override
  Future<void> close() {
    nameController.dispose();
    passwordController.dispose();
    confirmPasswrodController.dispose();
    phoneController.dispose();
    cityController.dispose();
    return super.close();
  }
}
