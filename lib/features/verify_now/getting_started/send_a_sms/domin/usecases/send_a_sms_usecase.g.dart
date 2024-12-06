// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_a_sms_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendASmsPrams _$SendASmsPramsFromJson(Map<String, dynamic> json) =>
    SendASmsPrams(
      customerId: json['customerId'] as String? ?? '',
      mobileNumber: json['mobileNumber'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      flowType: json['flowType'] as String? ?? '',
      type: json['type'] as String? ?? '',
      senderId: json['senderId'] as String? ?? '',
      message: json['message'] as String? ?? '',
      authToken: json['authToken'] as String? ?? '',
    );

Map<String, dynamic> _$SendASmsPramsToJson(SendASmsPrams instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'mobileNumber': instance.mobileNumber,
      'countryCode': instance.countryCode,
      'flowType': instance.flowType,
      'type': instance.type,
      'senderId': instance.senderId,
      'message': instance.message,
      'authToken': instance.authToken,
    };
