abstract class ForgetPasswrodState {}

class ForgetpassIntinalState extends ForgetPasswrodState {}

class ForgetpassLoadingState extends ForgetPasswrodState {}

class ForgetpassSuccessState extends ForgetPasswrodState {
  final String succesMessage;
  ForgetpassSuccessState({required this.succesMessage});
}

class ForgetpassFailureState extends ForgetPasswrodState {
  final String errorMessage;
  ForgetpassFailureState({required this.errorMessage});
}
