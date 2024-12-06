// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_verify_a_user_otp_verification_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyAUserOtpVerificationPrams _$VerifyAUserOtpVerificationPramsFromJson(
        Map<String, dynamic> json) =>
    VerifyAUserOtpVerificationPrams(
      code: json['code'] as String? ?? '',
      customerId: json['customerId'] as String? ?? '',
      verificationId: json['verificationId'] as String? ?? '',
      authToken: json['authToken'] as String? ?? '',
    );

Map<String, dynamic> _$VerifyAUserOtpVerificationPramsToJson(
        VerifyAUserOtpVerificationPrams instance) =>
    <String, dynamic>{
      'code': instance.code,
      'customerId': instance.customerId,
      'verificationId': instance.verificationId,
      'authToken': instance.authToken,
    };
