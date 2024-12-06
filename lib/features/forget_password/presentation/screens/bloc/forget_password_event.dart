import 'package:equatable/equatable.dart';

abstract class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();

  @override
  List<Object> get props => [];
}

class GetForgetPasswordEmailPressedButton extends ForgetPasswordEvent {
  final String? email;

  const GetForgetPasswordEmailPressedButton({
    required this.email,
  });
}

// class GetForgetPasswordOTpPressedButton extends ForgetPasswordEvent {
//   final String? code;
//   final String? email;
//   final String verificationId;

//   const GetForgetPasswordOTpPressedButton({
//     required this.code,
//     required this.verificationId,
//     required this.email

//   });
// }

class GetConfirmPasswordPressedButton extends ForgetPasswordEvent {
  final String? authToken;
  final String? email;
  final String? newPassword;

  const GetConfirmPasswordPressedButton({
    required this.authToken,
    required this.email,
    required this.newPassword

  });
}

class ForgetPasswordEmailOtpVisibility extends ForgetPasswordEvent {
  final bool isvisibileEmailOtp;
  const ForgetPasswordEmailOtpVisibility({this.isvisibileEmailOtp = true});
}
