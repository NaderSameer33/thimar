class AddCartState {}

class AddCartLoadingState extends AddCartState {
  final int id;
  AddCartLoadingState({required this.id});
}

class AddCartSuccessState extends AddCartState {
  final String succesMessage;
  final int id;
  AddCartSuccessState({required this.succesMessage, required this.id});
}

class AddCartFailureState extends AddCartState {
  final String errorMessage;
  AddCartFailureState({required this.errorMessage});
}
