// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_resend_otp_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendOtpRequestPrams _$ResendOtpRequestPramsFromJson(
        Map<String, dynamic> json) =>
    ResendOtpRequestPrams(
      email: json['email'] as String? ?? '',
      phoneCode: json['phoneCode'] as String? ?? '',
      phoneNo: json['phoneNo'] as String? ?? '',
    );

Map<String, dynamic> _$ResendOtpRequestPramsToJson(
        ResendOtpRequestPrams instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phoneCode': instance.phoneCode,
      'phoneNo': instance.phoneNo,
    };
