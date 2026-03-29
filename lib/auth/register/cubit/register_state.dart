abstract class RegisterState {}

class SuccessState extends RegisterState {
  final String succesMessage ;
  SuccessState({required this.succesMessage}) ;
}
class  IntinalState extends RegisterState {}

class LoadingState extends RegisterState {}

class FaliureState extends RegisterState {
  final String errorMessage;
  FaliureState({required this.errorMessage});
}
