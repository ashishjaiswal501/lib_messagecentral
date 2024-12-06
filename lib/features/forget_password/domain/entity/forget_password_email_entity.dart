
import 'package:freezed_annotation/freezed_annotation.dart';


part 'forget_password_email_entity.freezed.dart';

@freezed
class ForgetPasswordEmailEntity with _$ForgetPasswordEmailEntity {
  const factory ForgetPasswordEmailEntity({
    int? responseCode,
    String? message,
    UserData? data,
  }) = _ForgetPasswordEmailEntity;
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    String? verificationId,
    String? mobileNumber,
    String? responseCode,
    dynamic errorMessage,
    String? timeout,
    dynamic smsCli,
    dynamic transactionId,
    bool? newUser,
    String? accountStatus,
    String? countryStatus,
  }) = _UserData;
}
