class RemoveCartState {}

class CartRemoveSuccesState extends RemoveCartState {
  final String succesMessage;
  CartRemoveSuccesState({required this.succesMessage});
}

class CartRemoveFailureState extends RemoveCartState {
  final String errorMessage;
  CartRemoveFailureState({required this.errorMessage});
}