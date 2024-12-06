// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_update_phoneno_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePhoneNoRequest _$UpdatePhoneNoRequestFromJson(
        Map<String, dynamic> json) =>
    UpdatePhoneNoRequest(
      customerId: json['customerId'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      otp: json['otp'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      verificationId: json['verificationId'] as String? ?? '',
    );

Map<String, dynamic> _$UpdatePhoneNoRequestToJson(
        UpdatePhoneNoRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'verificationId': instance.verificationId,
      'otp': instance.otp,
      'countryCode': instance.countryCode,
      'customerId': instance.customerId,
    };
