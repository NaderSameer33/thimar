abstract class OtpState {}

class OtpIntinalState extends OtpState {}

class OtpLoadinState extends OtpState {}

class OtpSuccessState extends OtpState {
  final String succesMessage;
  OtpSuccessState( { required this.succesMessage});
}

class OtpFailureState extends OtpState {
    final String failureMessage;
  OtpFailureState({required this.failureMessage});
}



class CheckCodeSuccess extends OtpState  {
  final String succesMessage;
  final bool ? isActive ;
  CheckCodeSuccess( {this.isActive, required this.succesMessage});
}
class CheckCodeFailure extends OtpState  {
   final String failureMessage;
  CheckCodeFailure({required this.failureMessage});
}
