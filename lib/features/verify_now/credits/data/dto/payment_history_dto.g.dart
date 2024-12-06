// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentHistoryDtoImpl _$$PaymentHistoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentHistoryDtoImpl(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaymentHistoryDtoImplToJson(
        _$PaymentHistoryDtoImpl instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      id: (json['id'] as num?)?.toInt(),
      customerId: json['customerId'] as String?,
      transactionId: json['transactionId'],
      transactionDateTime: json['transactionDateTime'] == null
          ? null
          : DateTime.parse(json['transactionDateTime'] as String),
      creditsPurchased: (json['creditsPurchased'] as num?)?.toDouble(),
      balanceBeforePurchased:
          (json['balanceBeforePurchased'] as num?)?.toDouble(),
      balanceAfterPurchased:
          (json['balanceAfterPurchased'] as num?)?.toDouble(),
      creditsType: json['creditsType'] as String?,
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'transactionId': instance.transactionId,
      'transactionDateTime': instance.transactionDateTime?.toIso8601String(),
      'creditsPurchased': instance.creditsPurchased,
      'balanceBeforePurchased': instance.balanceBeforePurchased,
      'balanceAfterPurchased': instance.balanceAfterPurchased,
      'creditsType': instance.creditsType,
    };
