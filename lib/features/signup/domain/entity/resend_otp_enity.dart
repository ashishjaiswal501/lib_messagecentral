import 'package:freezed_annotation/freezed_annotation.dart';
part 'resend_otp_enity.freezed.dart';

@freezed
class ResendOtpEntity with _$ResendOtpEntity {
  const factory ResendOtpEntity({
    int? responseCode,
    String? message,
    UserData? userData,
  }) = _ResendOtpEntity;
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    String? verificationId,
    String? mobileNumber,
    String? responseCode,
  String? errorMessage,
   
    String? timeout,
  String? smsCLI,
    String? transactionId,
    bool? newUser,
  }) = _UserData;

 
}


