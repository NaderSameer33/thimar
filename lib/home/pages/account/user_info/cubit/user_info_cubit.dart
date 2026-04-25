import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/home/pages/account/user_info/cubit/user_info_state.dart';
import 'package:thimar/home/pages/account/user_info/models/user_info.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super((UserInfoState()));

  Future<void> getUserInfo() async {
    emit(UserInfoLoadingState());
    try {
      final response = await DioHelper.getData(endPoint: 'client/profile');
      if (response.isSucces) {
        final model = UserInfoData.fromJson(response.data).userInfoModel;
        CacheHelper.saveUser(userInfoModel: model);
        emit(UserInfoSuccesState(userInfoModel: model));
      }
    } on DioException catch (e) {
      emit(
        UserInfoFailureState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
