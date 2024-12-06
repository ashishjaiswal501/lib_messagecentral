import 'package:equatable/equatable.dart';

abstract class ResendOtpEvent extends Equatable {
  const ResendOtpEvent();
  @override

  List<Object?> get props => [];
}

class GetResendOtpPressedButton extends ResendOtpEvent {
  final String? email;
  final String? phoneNo;
  final String? phoneCode;

  const GetResendOtpPressedButton(
      {required this.email, required this.phoneNo, required this.phoneCode});
}
