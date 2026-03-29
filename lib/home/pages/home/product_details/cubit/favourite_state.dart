class FavouriteState {}


class   FavouriteSuccessState extends FavouriteState { 
  final String succesMessage  ;
  FavouriteSuccessState({required this.succesMessage}); 
}
class   FavouriteFailureState extends FavouriteState { 
  final String errorMessage ;
  FavouriteFailureState({required this.errorMessage}); 
}
class   RemoveFavouriteSuccessState extends FavouriteState { 
  final String succesMessage  ;
  RemoveFavouriteSuccessState({required this.succesMessage}); 
}
class   RemvoeFavouriteFailureState extends FavouriteState { 
  final String errorMessage ;
  RemvoeFavouriteFailureState({required this.errorMessage}); 
}