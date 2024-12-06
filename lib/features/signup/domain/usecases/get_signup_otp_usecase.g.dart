// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_signup_otp_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupOtpRequestPrams _$SignupOtpRequestPramsFromJson(
        Map<String, dynamic> json) =>
    SignupOtpRequestPrams(
      countryCode: json['countryCode'] as String? ?? '',
      customerId: json['customerId'] as String? ?? '',
      phoneNo: json['phoneNo'] as String? ?? '',
      authToken: json['authToken'] as String? ?? '',
    );

Map<String, dynamic> _$SignupOtpRequestPramsToJson(
        SignupOtpRequestPrams instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'customerId': instance.customerId,
      'phoneNo': instance.phoneNo,
      'authToken': instance.authToken,
    };
