import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/logic/dio_helper.dart';
import 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      final response = await DioHelper.sendData(
        endPoint: 'logout',
      );
      if (response.isSucces) {
        emit(LogoutSuccess(message: response.succesMessage ?? "تم تسجيل الخروج بنجاح"));
      } else {
        emit(LogoutFailure(message: response.exception ?? "حدث خطأ ما"));
      }
    } catch (e) {
      emit(LogoutFailure(message: e.toString()));
    }
  }
}
