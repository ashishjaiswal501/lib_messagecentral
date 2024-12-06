import 'package:equatable/equatable.dart';

 abstract class SignupOtpVerifyEvent extends Equatable{
  const SignupOtpVerifyEvent();
  @override

  List<Object?> get props => [];

}


class GetSignupVerifyOtpPressedButton extends SignupOtpVerifyEvent {
  final String? customerId; 
   final String? otp;
  final String? otpVerificationId;
  final String? authToken;

  const GetSignupVerifyOtpPressedButton({required this.customerId, required this.otp, required this.otpVerificationId,required this.authToken});
}