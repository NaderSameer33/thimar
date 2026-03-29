class RemoveCartState {}

class CartRemoveSuccesState extends RemoveCartState {
  final String succesMessage;
  final int proudctId;
  CartRemoveSuccesState({required this.proudctId, required this.succesMessage});
}

class CartRemoveFailureState extends RemoveCartState {
  final String errorMessage;
  CartRemoveFailureState({required this.errorMessage});
}
