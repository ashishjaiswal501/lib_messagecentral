// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_low_balance_alert_save_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LowBalanceAlertRequest _$LowBalanceAlertRequestFromJson(
        Map<String, dynamic> json) =>
    LowBalanceAlertRequest(
      alertAmount: (json['alertAmount'] as num?)?.toInt(),
      alternaletcountryCode1: json['alternaletcountryCode_1'] as String?,
      alternaletcountryCode2: json['alternaletcountryCode_2'] as String?,
      alternatePhoneNo1: json['alternatePhoneNo_1'] as String?,
      alternatePhoneNo2: json['alternatePhoneNo_2'] as String?,
      customerId: json['customerId'] as String?,
      lowBalanceAlertFlag: json['lowBalanceAlertFlag'] as bool?,
    );

Map<String, dynamic> _$LowBalanceAlertRequestToJson(
        LowBalanceAlertRequest instance) =>
    <String, dynamic>{
      'alertAmount': instance.alertAmount,
      'alternaletcountryCode_1': instance.alternaletcountryCode1,
      'alternaletcountryCode_2': instance.alternaletcountryCode2,
      'alternatePhoneNo_1': instance.alternatePhoneNo1,
      'alternatePhoneNo_2': instance.alternatePhoneNo2,
      'customerId': instance.customerId,
      'lowBalanceAlertFlag': instance.lowBalanceAlertFlag,
    };
