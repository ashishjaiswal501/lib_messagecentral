
// To parse this JSON data, do
//
//     final forgetPasswordOtpDto = forgetPasswordOtpDtoFromJson(jsonString);

// ignore_for_file: file_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:messagecentral/features/forget_password/domain/entity/forget_password_otp_entity.dart';

part 'forget_password_Otp_dto.freezed.dart';
part 'forget_password_Otp_dto.g.dart';

ForgetPasswordOtpDto forgetPasswordOtpDtoFromJson(String str) => ForgetPasswordOtpDto.fromJson(json.decode(str));

String forgetPasswordOtpDtoToJson(ForgetPasswordOtpDto data) => json.encode(data.toJson());

@freezed
class ForgetPasswordOtpDto with _$ForgetPasswordOtpDto {
    const factory ForgetPasswordOtpDto({
        @JsonKey(name: "responseCode")
        int? responseCode,
        @JsonKey(name: "message")
        String? message,
        @JsonKey(name: "data")
        Data? data,
    }) = _ForgetPasswordOtpDto;

    factory ForgetPasswordOtpDto.fromJson(Map<String, dynamic> json) => _$ForgetPasswordOtpDtoFromJson(json);
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
        String? authToken,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}


extension FOrgetPasswordEmailEntityExtension on ForgetPasswordOtpDto {
  ForgetPasswordOtpEntity get toEntity => ForgetPasswordOtpEntity(
        responseCode: responseCode,
        message: message,
        data: data?.toEntity(),
      );
}

extension ForgetPasswordOtpDataEntityExtention on Data {
  UserData toEntity() {
    return UserData(
        verificationId: verificationId,
        mobileNumber: mobileNumber,
        responseCode: responseCode,
        errorMessage: errorMessage,
        authToken: authToken,
        transactionId: transactionId,
      );
  }
}

