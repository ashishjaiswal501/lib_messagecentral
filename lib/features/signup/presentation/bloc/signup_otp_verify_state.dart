import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/signup/domain/entity/signup_verify_otp_enity.dart';

class SignupOtpVerifyState extends Equatable {
  final SignupVerifyOtpEntity? signupVerifyOtpEntity;
  final String? dioError;
  const SignupOtpVerifyState({this.signupVerifyOtpEntity, this.dioError});
  @override

  List<Object?> get props => [signupVerifyOtpEntity, dioError];
}

class SignupOtpVerifyStateInitial extends SignupOtpVerifyState {
  const SignupOtpVerifyStateInitial();
}

class SignupOtpVerifyStateLoading extends SignupOtpVerifyState {
  const SignupOtpVerifyStateLoading();
}
class SignupOtpVerifyStateError extends SignupOtpVerifyState {
  const SignupOtpVerifyStateError(String dioError) : super(dioError: dioError);
}

class SignupOtpVerifyStateSuccess extends SignupOtpVerifyState {
  const SignupOtpVerifyStateSuccess(
    SignupVerifyOtpEntity
        signupVerifyOtpEntity, 
  ) : super(signupVerifyOtpEntity: signupVerifyOtpEntity);
}
