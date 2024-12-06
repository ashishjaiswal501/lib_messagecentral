// To parse this JSON data, do
//
//     final signupOtpDto = signupOtpDtoFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
import 'package:messagecentral/features/signup/domain/entity/signup_otp_enity.dart';

part 'signup_otp_dto.freezed.dart';
part 'signup_otp_dto.g.dart';

SignupOtpDto signupOtpDtoFromJson(String str) => SignupOtpDto.fromJson(json.decode(str));

String signupOtpDtoToJson(SignupOtpDto data) => json.encode(data.toJson());

@freezed
class SignupOtpDto with _$SignupOtpDto {
    const factory SignupOtpDto({
        @JsonKey(name: "responseCode")
        int? responseCode,
        @JsonKey(name: "message")
        String? message,
        @JsonKey(name: "data")
        Data? data,
    }) = _SignupOtpDto;

    factory SignupOtpDto.fromJson(Map<String, dynamic> json) => _$SignupOtpDtoFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        @JsonKey(name: "customerId")
        String? customerId,
        @JsonKey(name: "otpVerificationId")
        String? otpVerificationId,
        @JsonKey(name: "accountStatus")
        String? accountStatus,
        @JsonKey(name: "countryStatus")
        String? countryStatus,
        @JsonKey(name: "countryCode")
        String? countryCode,
        @JsonKey(name: "mobileNumber")
        String? mobileNumber,
        @JsonKey(name: "countryName")
        String? countryName,
        @JsonKey(name: "fullName")
        String? fullName,
        @JsonKey(name: "email")
        String? email,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}



// toentity
extension SignupEntityExtension on SignupOtpDto {
  SignupOtpEntity get toEntity => SignupOtpEntity(
      responseCode: responseCode, message: message, userData: data?.toEntity());
}

extension UserDataEntityExtention on Data {
  UserData toEntity() {
    return UserData(
       customerId: customerId,
        otpVerificationId: otpVerificationId,
        accountStatus: accountStatus,
        countryStatus: countryStatus,
        countryCode: countryCode,
        mobileNumber:mobileNumber,
        countryName: countryName,
        fullName: fullName,
        email: email
    );
  }
}