// To parse this JSON data, do
//
//     final forgetPasswordEmailDto = forgetPasswordEmailDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:messagecentral/features/forget_password/domain/entity/forget_password_email_entity.dart';

part 'forget_password_email_dto.freezed.dart';
part 'forget_password_email_dto.g.dart';

@freezed
class ForgetPasswordEmailDto with _$ForgetPasswordEmailDto {
  const factory ForgetPasswordEmailDto({
    @JsonKey(name: "responseCode") int? responseCode,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") Data? data,
  }) = _ForgetPasswordEmailDto;

  factory ForgetPasswordEmailDto.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordEmailDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "verificationId") String? verificationId,
    @JsonKey(name: "mobileNumber") String? mobileNumber,
    @JsonKey(name: "responseCode") String? responseCode,
    @JsonKey(name: "errorMessage") dynamic errorMessage,
    @JsonKey(name: "timeout") String? timeout,
    @JsonKey(name: "smsCLI") dynamic smsCli,
    @JsonKey(name: "transactionId") dynamic transactionId,
    @JsonKey(name: "newUser") bool? newUser,
    @JsonKey(name: "accountStatus") String? accountStatus,
    @JsonKey(name: "countryStatus") String? countryStatus,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

extension FOrgetPasswordEmailEntityExtension on ForgetPasswordEmailDto {
  ForgetPasswordEmailEntity get toEntity => ForgetPasswordEmailEntity(
        responseCode: responseCode,
        message: message,
        data: data?.toEntity(),
      );
}

extension ForgetPasswordEmailDataEntityExtention on Data {
  UserData toEntity() {
    return UserData(
        verificationId: verificationId,
        mobileNumber: mobileNumber,
        responseCode: responseCode,
        errorMessage: errorMessage,
        timeout: timeout,
        smsCli: smsCli,
        transactionId: transactionId,
        newUser: newUser,
        accountStatus: accountStatus,
        countryStatus: countryStatus);
  }
}
