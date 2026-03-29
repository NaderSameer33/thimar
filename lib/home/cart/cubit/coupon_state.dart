class CouponState {}

class CouponLoadingState extends CouponState {}

class CouponSuccessState extends CouponState {
  final String succesMessage;
  CouponSuccessState({required this.succesMessage});
}

class CouponFailureState extends CouponState {
  final String errorMessage;
  CouponFailureState({required this.errorMessage});
}
