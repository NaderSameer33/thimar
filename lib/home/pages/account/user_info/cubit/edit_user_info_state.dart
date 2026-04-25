import 'package:thimar/home/pages/account/user_info/models/user_info.dart';

class EditUserInfoState {}

class EditInfoLoadingState extends EditUserInfoState {}

class EditInfoSuccesState extends EditUserInfoState {
  final String succesMessage ;
  EditInfoSuccesState({required this.succesMessage});
}

class EditInfoFailureState extends EditUserInfoState {
  final String errorMessage ; 
  EditInfoFailureState({required this.errorMessage}) ; 
}
