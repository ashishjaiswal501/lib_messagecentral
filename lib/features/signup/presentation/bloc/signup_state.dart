import 'package:equatable/equatable.dart';

import 'package:messagecentral/features/signup/domain/entity/signup_enity.dart';


abstract class SignupState extends Equatable {
  final SignupEntity? signupEntity;
  
  final String? dioError;
  final bool isobscureText;
  final bool isSignupSuccess;
  final bool isSignupOtpSuccess;
  final bool backToPrevious;
  final bool verifyOpt;
  final bool existingEmail;
  final bool isSignupVerifyOtpSuccess;
  final bool resendOtp;

  const SignupState(
      {this.signupEntity,
     
      this.dioError,
      this.isobscureText = true,
      this.isSignupSuccess = false,
      this.isSignupOtpSuccess = false,
      this.backToPrevious = false,
      this.verifyOpt = false,
      this.existingEmail = false,
      this.isSignupVerifyOtpSuccess = false,
      this.resendOtp=false});

  @override
  List<Object?> get props => [
        signupEntity,
       
        dioError,
        isobscureText
      ];
}

class SignupformState extends SignupState {
  const SignupformState(
    SignupEntity signupEntity,
  ) : super(signupEntity: signupEntity);
}





class SignupStateInitial extends SignupState {
  const SignupStateInitial()
      : super(
            isSignupOtpSuccess: false,
            isSignupSuccess: false,
            backToPrevious: false,
            verifyOpt: false);
}

class BacktoPreviousStateInitial extends SignupState {
  const BacktoPreviousStateInitial()
      : super(
            isSignupOtpSuccess: false,
            isSignupSuccess: false,
            backToPrevious: true,
            verifyOpt: false);
}

class SignupStateLoading extends SignupState {
  const SignupStateLoading()
      : super(
            isSignupOtpSuccess: false,
            isSignupSuccess: false,
            backToPrevious: false,
            verifyOpt: false);
}

class SignupStateSuccess extends SignupState {
  const SignupStateSuccess(SignupEntity signupEntity)
      : super(
            signupEntity: signupEntity,
            isSignupSuccess: true,
            backToPrevious: false);
}




class SignupStateError extends SignupState {
  const SignupStateError(String dioError)
      : super(
            dioError: dioError,
            isSignupSuccess: true,
            backToPrevious: false,
            verifyOpt: false,
            isSignupOtpSuccess: false);
}





class ObscureTextVisibilityState extends SignupState {
  const ObscureTextVisibilityState(bool isobscureText)
      : super(
            isobscureText: isobscureText,
            isSignupSuccess: false,
            backToPrevious: false,
            verifyOpt: false);
}
