import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_otp_enity.freezed.dart';

@freezed
class SignupOtpEntity with _$SignupOtpEntity {
  const factory SignupOtpEntity({
    int? responseCode,
    String? message,
    UserData? userData,
  }) = _SignupOtpEntity;
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    String? customerId,
    String? otpVerificationId,
    String? accountStatus,
  String? countryStatus,
    String? countryCode,
    String? mobileNumber,
  String? countryName,
    String? fullName,
    String? email,
  }) = _UserData;

 
}


