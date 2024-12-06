// To parse this JSON data, do
//
//     final resendOtpDto = resendOtpDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';


import 'package:messagecentral/features/signup/domain/entity/resend_otp_enity.dart';

part 'resend_otp_dto.freezed.dart';
part 'resend_otp_dto.g.dart';


@freezed
class ResendOtpDto with _$ResendOtpDto {
    const factory ResendOtpDto({
        @JsonKey(name: "responseCode")
        int? responseCode,
        @JsonKey(name: "message")
        String? message,
        @JsonKey(name: "data")
        Data? data,
    }) = _ResendOtpDto;

    factory ResendOtpDto.fromJson(Map<String, dynamic> json) => _$ResendOtpDtoFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        @JsonKey(name: "verificationId")
        String? verificationId,
        @JsonKey(name: "mobileNumber")
        String? mobileNumber,
        @JsonKey(name: "responseCode")
        String? responseCode,
        @JsonKey(name: "errorMessage")
        String? errorMessage,
        @JsonKey(name: "timeout")
        String? timeout,
        @JsonKey(name: "smsCLI")
        dynamic smsCli,
        @JsonKey(name: "transactionId")
        dynamic transactionId,
        @JsonKey(name: "newUser")
        bool? newUser,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}


// toentity
extension SignupEntityExtension on ResendOtpDto {
  ResendOtpEntity get toEntity => ResendOtpEntity(
      responseCode: responseCode, message: message, userData: data?.toEntity());
}

extension UserDataEntityExtention on Data {
  UserData toEntity() {
    return UserData(
       verificationId: verificationId,
        mobileNumber: mobileNumber,
        responseCode: responseCode,
        errorMessage: errorMessage,
        timeout: timeout,
        smsCLI: smsCli,
        transactionId: transactionId,
        newUser: newUser,
    );
  }
}