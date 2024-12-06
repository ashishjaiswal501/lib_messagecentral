
import 'package:freezed_annotation/freezed_annotation.dart';
part 'verify_a_user_otp_verification_entity.freezed.dart';

@freezed
class VerifyAUserOtpVerificationEntity with _$VerifyAUserOtpVerificationEntity {
  const factory VerifyAUserOtpVerificationEntity({
    int? responseCode,
    String? message,
    UserData? userData,
  }) = _VerifyAUserOtpVerificationEntity;
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    int? verificationId,
    String? mobileNumber,
    String? verificationStatus,
    String? responseCode,
    String? errorMessage,
    String? transactionId,
    String? authToken,
  }) = _UserData;

}