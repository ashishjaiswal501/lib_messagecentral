import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/signup/domain/entity/signup_otp_enity.dart';

abstract class SignupOtpState extends Equatable {
  final SignupOtpEntity? signupOtpEntity;
  final String? dioError;
  final int? responseCode;
  const SignupOtpState({this.signupOtpEntity, this.dioError, this.responseCode});
  @override
  List<Object?> get props => [signupOtpEntity, dioError];
}

class SignupOtpLoading extends SignupOtpState {
  const SignupOtpLoading();
}

class SignupOtpStateInitial extends SignupOtpState {
  const SignupOtpStateInitial();
}

class SignupOtpStateError extends SignupOtpState {
  const SignupOtpStateError(String dioError, int responseCode) : super(dioError: dioError, responseCode: responseCode);
}

class SignupOtpStateSucces extends SignupOtpState {
  const SignupOtpStateSucces(
    SignupOtpEntity signupOtpEntity,
  ) : super(signupOtpEntity: signupOtpEntity);
}
