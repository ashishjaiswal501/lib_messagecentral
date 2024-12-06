// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_analytics_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyticsRequestPrams _$AnalyticsRequestPramsFromJson(
        Map<String, dynamic> json) =>
    AnalyticsRequestPrams(
      customerId: json['customerId'] as String? ?? '',
      fromDate: json['fromDate'] as String? ?? '',
      toDate: json['toDate'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$AnalyticsRequestPramsToJson(
        AnalyticsRequestPrams instance) =>
    <String, dynamic>{
      'type': instance.type,
      'customerId': instance.customerId,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
    };
