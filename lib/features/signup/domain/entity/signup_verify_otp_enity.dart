import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_verify_otp_enity.freezed.dart';

@freezed
class SignupVerifyOtpEntity with _$SignupVerifyOtpEntity {
  const factory SignupVerifyOtpEntity({
    int? responseCode,
    String? message,
    UserData? userData,
  }) = _SignupVerifyOtpEntity;
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    String? authToken,
    String? accountStatus,
    String? customerId,
    String? countryCode,
    String? mobileNumber,
  }) = _UserData;
}
