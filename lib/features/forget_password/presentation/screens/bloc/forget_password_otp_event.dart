import 'package:equatable/equatable.dart';

abstract class ForgetPasswordOtpEvent extends Equatable {
  const ForgetPasswordOtpEvent();

  @override
  List<Object> get props => [];
}



class GetForgetPasswordOTpPressedButton extends ForgetPasswordOtpEvent {
  final String? code;
  final String? email;
  final String verificationId;

  const GetForgetPasswordOTpPressedButton({
    required this.code,
    required this.verificationId,
    required this.email

  });
}


