abstract class LoginState {}


class LoginIntinalState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{
  final String succesMessage  ;
  LoginSuccessState({required this.succesMessage}) ; 
}
class LoginFailureState extends LoginState{
   final String errorMessage  ;
  LoginFailureState({required this.errorMessage}) ; 
}