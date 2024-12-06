
import 'package:freezed_annotation/freezed_annotation.dart';


part 'forget_password_otp_entity.freezed.dart';


@freezed
class ForgetPasswordOtpEntity with _$ForgetPasswordOtpEntity {
  const factory ForgetPasswordOtpEntity({
    int? responseCode,
    String? message,
    UserData? data,
  }) = _ForgetPasswordOtpEntity;
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    int? verificationId,
    String? mobileNumber,
    String? verificationStatus,
    String? responseCode,
    dynamic errorMessage,
    dynamic transactionId,
    String? authToken,
  }) = _UserData;
}
