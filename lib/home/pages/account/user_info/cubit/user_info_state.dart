import 'package:thimar/home/pages/account/user_info/models/user_info.dart';

class UserInfoState {}

class UserInfoSuccesState extends UserInfoState {
  final UserInfoModel userInfoModel;
  UserInfoSuccesState({required this.userInfoModel});
}

class UserInfoLoadingState extends UserInfoState {}

class UserInfoFailureState extends UserInfoState {
  final String errorMessage;
  UserInfoFailureState({required this.errorMessage});
}
