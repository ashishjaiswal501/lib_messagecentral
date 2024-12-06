// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_verify_a_user_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyAUserPrams _$VerifyAUserPramsFromJson(Map<String, dynamic> json) =>
    VerifyAUserPrams(
      flowType: json['flowType'] as String? ?? '',
      customerId: json['customerId'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      mobileNumber: json['mobileNumber'] as String? ?? '',
      authToken: json['authToken'] as String? ?? '',
    );

Map<String, dynamic> _$VerifyAUserPramsToJson(VerifyAUserPrams instance) =>
    <String, dynamic>{
      'flowType': instance.flowType,
      'customerId': instance.customerId,
      'countryCode': instance.countryCode,
      'mobileNumber': instance.mobileNumber,
      'authToken': instance.authToken,
    };
