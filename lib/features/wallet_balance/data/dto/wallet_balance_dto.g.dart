// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_balance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletBalanceDtoImpl _$$WalletBalanceDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletBalanceDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WalletBalanceDtoImplToJson(
        _$WalletBalanceDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      customerId: json['customerId'] as String?,
      credits: (json['credits'] as num?)?.toDouble(),
      lastRechargedCredit: (json['lastRechargedCredit'] as num?)?.toDouble(),
      createdDateTime: json['createdDateTime'] == null
          ? null
          : DateTime.parse(json['createdDateTime'] as String),
      updatedDateTime: json['updatedDateTime'] == null
          ? null
          : DateTime.parse(json['updatedDateTime'] as String),
      minimumCreditsAllowed: json['minimumCreditsAllowed'] as String?,
      userPaid: json['userPaid'] as bool?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'credits': instance.credits,
      'lastRechargedCredit': instance.lastRechargedCredit,
      'createdDateTime': instance.createdDateTime?.toIso8601String(),
      'updatedDateTime': instance.updatedDateTime?.toIso8601String(),
      'minimumCreditsAllowed': instance.minimumCreditsAllowed,
      'userPaid': instance.userPaid,
    };
