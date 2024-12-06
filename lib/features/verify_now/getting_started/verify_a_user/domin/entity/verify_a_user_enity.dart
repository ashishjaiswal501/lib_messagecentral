import 'package:freezed_annotation/freezed_annotation.dart';
part 'verify_a_user_enity.freezed.dart';

@freezed
class VerifyAUserEntity with _$VerifyAUserEntity {
  const factory VerifyAUserEntity({
    int? responseCode,
    String? message,
    UserData? userData,
  }) = _VerifyAUserEntity;
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    String? verificationId,
    String? mobileNumber,
    String? responseCode,
    String? errorMessage,
    String? timeout,
    String? smsCli,
    String? transactionId, String? verificationStatus,
  }) = _UserData;

}