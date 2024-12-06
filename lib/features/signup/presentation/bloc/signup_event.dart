import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class GetSignupPressedButton extends SignupEvent {
  final String? fullName; 
   final String? email;
  final String? password;

  const GetSignupPressedButton({required this.fullName, required this.email, required this.password});
}


// class GetSignupOtpPressedButton extends SignupEvent {
//   final String? countryCode; 
//    final String? customerId;
//   final String? phoneNo;
//   final String? authToken;
//   // final String? otpVerificationId;
//   const GetSignupOtpPressedButton({required this.countryCode,  required this.customerId, required this.phoneNo, required this.authToken
//   //,required this.otpVerificationId
//   });
// }

// class GetSignupVerifyOtpPressedButton extends SignupEvent {
//   final String? customerId; 
//    final String? otp;
//   final String? otpVerificationId;
//   final String? authToken;

//   const GetSignupVerifyOtpPressedButton({required this.customerId, required this.otp, required this.otpVerificationId,required this.authToken});
// }

// class GetResendOtpPressedButton extends SignupEvent {
//   final String? email; 
//    final String? phoneNo;
//   final String? phoneCode;

//   const GetResendOtpPressedButton({required this.email, required this.phoneNo, required this.phoneCode});
// }

class GetobscureTextVisibility extends SignupEvent{
 
  final bool obscureText;
 const GetobscureTextVisibility({this.obscureText=true});

}


class BackToPreviousStepEvent extends SignupEvent {}
