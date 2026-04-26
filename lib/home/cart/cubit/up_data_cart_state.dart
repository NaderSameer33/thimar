class UpDataCartState {}

class UpDataCartLoadingState extends UpDataCartState {}

class UpDataCartSuccessState extends UpDataCartState {
  final String succesMessage;
  UpDataCartSuccessState({required this.succesMessage});
}

class UpDataCartFailureState extends UpDataCartState {
  final String errorMessage;
  UpDataCartFailureState({required this.errorMessage});
}
