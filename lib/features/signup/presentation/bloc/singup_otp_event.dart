import 'package:equatable/equatable.dart';

abstract class SignupOtpEvent extends Equatable {
  const SignupOtpEvent();

  @override
  List<Object> get props => [];
}

class GetSignupOtpPressedsButton extends SignupOtpEvent {
  final String? countryCode;
  final String? customerId;
  final String? phoneNo;
  final String? authToken;

  const GetSignupOtpPressedsButton(
      {required this.countryCode,
      required this.customerId,
      required this.phoneNo,
      required this.authToken,
      });
}


