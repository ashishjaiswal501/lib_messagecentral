// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payment_history_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentHistoryRequestPrams _$PaymentHistoryRequestPramsFromJson(
        Map<String, dynamic> json) =>
    PaymentHistoryRequestPrams(
      customerId: json['customerId'] as String? ?? '',
      fromDate: json['fromDate'] as String? ?? '',
      toDate: json['toDate'] as String? ?? '',
    );

Map<String, dynamic> _$PaymentHistoryRequestPramsToJson(
        PaymentHistoryRequestPrams instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
    };
