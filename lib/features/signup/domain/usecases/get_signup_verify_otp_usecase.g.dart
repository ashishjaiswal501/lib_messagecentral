// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_signup_verify_otp_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupVerifyOtpRequestPrams _$SignupVerifyOtpRequestPramsFromJson(
        Map<String, dynamic> json) =>
    SignupVerifyOtpRequestPrams(
      customerId: json['customerId'] as String? ?? '',
      otp: json['otp'] as String? ?? '',
      otpVerificationId: json['otpVerificationId'] as String? ?? '',
      authToken: json['authToken'] as String? ?? '',
    );

Map<String, dynamic> _$SignupVerifyOtpRequestPramsToJson(
        SignupVerifyOtpRequestPrams instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'customerId': instance.customerId,
      'otpVerificationId': instance.otpVerificationId,
      'authToken': instance.authToken,
    };
