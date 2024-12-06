// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_dashboard_sms_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardSmsPrams _$DashboardSmsPramsFromJson(Map<String, dynamic> json) =>
    DashboardSmsPrams(
      customerId: json['customerId'] as String? ?? '',
      fromDate: json['fromDate'] as String? ?? '',
      toDate: json['toDate'] as String? ?? '',
      authToken: json['authToken'] as String? ?? '',
    );

Map<String, dynamic> _$DashboardSmsPramsToJson(DashboardSmsPrams instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'authToken': instance.authToken,
    };
