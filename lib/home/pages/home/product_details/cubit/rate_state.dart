import '../models/rate_model.dart';

class RateState {}

class RateLoadingState extends RateState {}

class RateFailureState extends RateState {
  final String errorMessage;
  RateFailureState({required this.errorMessage});
}

class RateSuccessState extends RateState {
  final List<RateModel> rates;
  RateSuccessState({required this.rates});
}
