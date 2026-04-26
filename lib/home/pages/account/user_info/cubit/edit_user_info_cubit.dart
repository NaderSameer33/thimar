import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/home/pages/account/user_info/cubit/edit_user_info_state.dart';
import 'package:thimar/home/pages/account/user_info/models/user_info.dart';

class EditUserInfoCubit extends Cubit<EditUserInfoState> {
  EditUserInfoCubit() : super(EditUserInfoState());

  Future<void> editUserInfo({
    required String imagePath,
    required String name,
    required String phone,
    required String city,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      emit(EditInfoLoadingState());

      if (imagePath.isEmpty) {
        emit(EditInfoFailureState(errorMessage: 'الرجاء اختيار صورة'));
        return;
      }

      if (password != confirmPassword) {
        emit(EditInfoFailureState(errorMessage: 'كلمات المرور غير متطابقة'));
        return;
      }

      final formData = FormData.fromMap({
        'fullname': name,
        'phone': phone,
        'city': city,
        'password': password,
        'password_confirmation': confirmPassword,
      });

      if (imagePath != 'KEEP_CURRENT_IMAGE') {
        final image = await MultipartFile.fromFile(imagePath);
        formData.files.add(MapEntry('image', image));
      }

      final respone = await DioHelper.sendData(
        endPoint: 'client/profile',
        data: formData,
      );

      final userInfoModel = UserInfoModel.fromJson(
        respone.data['data'] ?? respone.data,
      );
      await CacheHelper.saveUser(userInfoModel: userInfoModel);
      emit(
        EditInfoSuccesState(
          succesMessage: respone.data['message'] ?? 'تم تحديث البيانات بنجاح',
        ),
      );
    } on DioException catch (e) {
      String errorMessage = 'حدث خطأ في الاتصال';
      if (e.response?.data != null && e.response!.data is Map) {
        errorMessage = e.response!.data['message'] ?? e.toString();
      } else if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'انتهت مهلة الاتصال';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'انتهت مهلة استقبال البيانات';
      }
      emit(EditInfoFailureState(errorMessage: errorMessage));
    } catch (e) {
      emit(EditInfoFailureState(errorMessage: 'حدث خطأ: ${e.toString()}'));
    }
  }
}
