import 'package:equatable/equatable.dart';

abstract class VerifyAUserEvent extends Equatable {
  const VerifyAUserEvent();

  @override
  List<Object> get props => [];
}

class GetVerifyAUserPressedButton extends VerifyAUserEvent {
  final String? flowType; 
   final String? customerId;
  final String? countryCode;
  final String? mobileNumber;
  final String? authToken;


  const GetVerifyAUserPressedButton({required this.flowType, required this.customerId, required this.countryCode, required this.mobileNumber,required this.authToken});
}


class GetVerifyAUserOtpVerificationPressedButton extends VerifyAUserEvent {
   final String? customerId;
  final String? code;
  final String? verificationId;
  final String? authToken;

  const GetVerifyAUserOtpVerificationPressedButton({required this.customerId, required this.code, required this.verificationId,required this.authToken});
}


class GetVerifyAUserUpdateBrandNamePressedButtons extends VerifyAUserEvent {
   
  final String? brandName;
   final String? customerId;
  final String? authToken;

  const GetVerifyAUserUpdateBrandNamePressedButtons({required this.brandName, required this.customerId,required this.authToken});
}


