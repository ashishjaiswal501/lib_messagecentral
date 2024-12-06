// To parse this JSON data, do
//
//     final verifyAUserOtpVerificationDto = verifyAUserOtpVerificationDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';


import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/entity/verify_a_user_otp_verification_entity.dart';

part 'verify_a_user_otp_verification_dto.freezed.dart';
part 'verify_a_user_otp_verification_dto.g.dart';


@freezed
class VerifyAUserOtpVerificationDto with _$VerifyAUserOtpVerificationDto {
    const factory VerifyAUserOtpVerificationDto({
        @JsonKey(name: "responseCode")
        int? responseCode,
        @JsonKey(name: "message")
        String? message,
        @JsonKey(name: "data")
        Data? data,
    }) = _VerifyAUserOtpVerificationDto;

    factory VerifyAUserOtpVerificationDto.fromJson(Map<String, dynamic> json) => _$VerifyAUserOtpVerificationDtoFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        @JsonKey(name: "verificationId")
        int? verificationId,
        @JsonKey(name: "mobileNumber")
        String? mobileNumber,
        @JsonKey(name: "verificationStatus")
        String? verificationStatus,
        @JsonKey(name: "responseCode")
        String? responseCode,
        @JsonKey(name: "errorMessage")
        dynamic errorMessage,
        @JsonKey(name: "transactionId")
        dynamic transactionId,
        @JsonKey(name: "authToken")
        dynamic authToken,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}


// toentity
extension VerifyAUserOtpVerificationExtension on VerifyAUserOtpVerificationDto {
  VerifyAUserOtpVerificationEntity get toEntity =>
      VerifyAUserOtpVerificationEntity(
          responseCode: responseCode,
          message: message,
          userData: data?.toEntity());
}

extension UserDataEntityExtention on Data {
  UserData toEntity() {
    return UserData(
        verificationId: verificationId,
        mobileNumber: mobileNumber,
        verificationStatus: verificationStatus,
        responseCode: responseCode,
        errorMessage: errorMessage,
        transactionId: transactionId,
        authToken: authToken);
  }
}
