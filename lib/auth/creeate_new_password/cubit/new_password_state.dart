abstract class NewPasswordState {}

class NewPasswordIntinalState extends NewPasswordState{}
class NewPasswordLoadingState extends NewPasswordState{}
class NewPasswrodSuccessState extends NewPasswordState{
  final String succesMessage ; 
  NewPasswrodSuccessState({required this.succesMessage}) ; 
}
class NewPasswordFailureState extends NewPasswordState{
    final String errorMessage ; 
  NewPasswordFailureState({required this.errorMessage}) ; 
}