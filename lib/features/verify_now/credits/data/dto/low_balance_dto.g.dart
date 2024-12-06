// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'low_balance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LowBalanceDtoImpl _$$LowBalanceDtoImplFromJson(Map<String, dynamic> json) =>
    _$LowBalanceDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LowBalanceDtoImplToJson(_$LowBalanceDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      customerId: json['customerId'] as String?,
      alertAmount: (json['alertAmount'] as num?)?.toInt(),
      alternaletcountryCode1: json['alternaletcountryCode_1'],
      alternatePhoneNo1: json['alternatePhoneNo_1'],
      alternaletcountryCode2: json['alternaletcountryCode_2'],
      alternatePhoneNo2: json['alternatePhoneNo_2'],
      lowBalanceAlertFlag: json['lowBalanceAlertFlag'] as bool?,
      islowBalanceAlertSent: json['islowBalanceAlertSent'] as bool?,
      lowBalanceAlertSentDateTime: json['lowBalanceAlertSentDateTime'],
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'alertAmount': instance.alertAmount,
      'alternaletcountryCode_1': instance.alternaletcountryCode1,
      'alternatePhoneNo_1': instance.alternatePhoneNo1,
      'alternaletcountryCode_2': instance.alternaletcountryCode2,
      'alternatePhoneNo_2': instance.alternatePhoneNo2,
      'lowBalanceAlertFlag': instance.lowBalanceAlertFlag,
      'islowBalanceAlertSent': instance.islowBalanceAlertSent,
      'lowBalanceAlertSentDateTime': instance.lowBalanceAlertSentDateTime,
    };
